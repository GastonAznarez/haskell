module Language.Semantics where

import Language.Syntax
import Language.ListaAsoc
import Data.Maybe

-- Asignación de valores para las variables enteras
type StateI = ListaAsoc VarName Int
-- Asignación de valores para las variables booleanas
type StateB = ListaAsoc VarName Bool

defaultIntValue :: Int
defaultIntValue = 0

defaultBoolValue :: Bool
defaultBoolValue = True

-- Tipo que representa la continuación de un paso de ejecución.
-- Ésta puede ser: Falta ejecutar una sentencia (ToExec), o ya no hay nada por
-- ejecutar (Finish).
data Continuation = ToExec Statement
                  | Finish


-- El estado consta del valor de las variables enteras y las booleanas
type State = (StateI,StateB)

evalIExpr :: IntExpr -> StateI -> Int
evalIExpr (ConstI x) a = x
evalIExpr (VI x) a = fromJust (la_buscar a x)
evalIExpr (Neg x) a = -1 * evalIExpr x a
evalIExpr (Plus x y) a = (evalIExpr x a) + (evalIExpr y a)
evalIExpr (Prod x y) a = (evalIExpr x a) * (evalIExpr y a)
evalIExpr (Div x y) a = div (evalIExpr x a) (evalIExpr y a)
evalIExpr (Mod x y) a = mod (evalIExpr x a) (evalIExpr y a)



-- Para evaluar las expresiones booleanas
-- necesitamos también el estado de variables enteras
-- porque en Equal y Less tenemos subexpresiones enteras.
evalBExpr :: BoolExpr -> State -> Bool
evalBExpr (ConstB b) s = b
evalBExpr (VB v) (si, sb) = case la_buscar sb v of
				Just e -> e
				Nothing -> defaultBoolValue
evalBExpr (And b1 b2) s = (evalBExpr b1 s) && (evalBExpr b2 s)
evalBExpr (Or b1 b2) s = (evalBExpr b1 s) || (evalBExpr b2 s)
evalBExpr (Not b) s = not (evalBExpr b s)
evalBExpr (Equal i1 i2) (si, sb) = (evalIExpr i1 si) == (evalIExpr i2 si)
evalBExpr (Less i1 i2) (si, sb) = (evalIExpr i1 si) < (evalIExpr i2 si)


-- Evaluar un paso de ejecución en un programa.
evalStep :: Statement -> State -> (State , Continuation)
evalStep Skip e = (e,Finish)
evalStep (AssignB (Var vS vT) bExp) (sI, sB) = ((sI,(la_cambiar vS (evalBExpr bExp (sI, sB)) sB)),Finish)
--evalStep (AssignI (Var vS vT) iExp) (sI, sB) = (((la_cambiar vS (evalIExpr iExp sI) sI) , sB), Finish)
evalStep (AssignI (Var vS vT) iExp) (sI, sB) = ( ( (la_cambiar vS ( evalIExpr iExp sI ) sI) , sB) , Finish)
evalStep (Seq s1 s2) est = case evalStep s1 est of
                          (nState, Finish) -> (nState, ToExec s2)
                          (nState, ToExec s3) -> (nState, ToExec (Seq s3 s2))
evalStep (If (x:list)) est = case evalBExpr (fst x) est of
                          True -> (est, ToExec (snd x))
                          False -> (est, ToExec (If list))
evalStep (Do bExp s1) est = case evalBExpr bExp est of
                          True -> (est, ToExec (Seq s1 (Do bExp s1)))
                          False -> (est, Finish)
