--Ejercicio 2
-- x = 4k
-- y = -4k
-- z = 8k
-- b = not w o b = w = False
--Ejercicio 3
-- En HAL el estado se maniupula despues de cada Sentencia.
data ListaAsoc a b = Vacia
                   | Nodo a b (ListaAsoc a b)


-- Devuelve la cantidad de "datos" en una lista
la_long :: Integral c => ListaAsoc a b -> c
la_long Vacia = 0
la_long (Nodo a b p) = 1 + la_long p


-- Transforma una lista de asociaciones en una lista de pares (clave, dato)
la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = []
la_pares (Nodo a b p) = [(a,b)]++ la_pares p


-- Dada una lista y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing.
la_buscar :: Eq a => ListaAsoc a b -> a -> Maybe b
la_buscar Vacia _ = Nothing
la_buscar(Nodo a b p) c | a == c = Just b
                        | otherwise = la_buscar p c

-- Verifica si una clave existe en una lista
la_existe :: Eq a => ListaAsoc a b -> a -> Bool
la_existe Vacia _ = False
la_existe (Nodo a b p) c | c == a = True
                         | otherwise = la_existe p c


-- Dada una lista, agrega una clave con su valor asociado "d" en la lista si la clave NO existe. En caso de que la clave exista, reemplaza el dato con el nuevo dato "d".
la_agregar :: Eq a => a -> b -> ListaAsoc a b -> ListaAsoc a b
la_agregar a b Vacia = (Nodo a b Vacia)
la_agregar c d (Nodo a b p) | a == c = (Nodo a d p)
                            | otherwise = (Nodo a b (la_agregar c d p ))


-- Dada una clave, elimina el dato asociado en la lista.
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar a (Nodo b c d) | a == b = d
                         | otherwise = (Nodo b c (la_borrar a d))


la_cambiar :: Eq a => a -> b -> ListaAsoc a b -> ListaAsoc a b
la_cambiar _ _ Vacia = Vacia
la_cambiar a e (Nodo b c d) | a == b = (Nodo b e d )
                          | otherwise = (Nodo b c (la_cambiar a d))
--Ejercicio 4
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

--Ejercicio 6
--Este programa calcula el minimo de 3 numeros y lo almacena en la variable m

--Ejercicio 7
-- a) Es el algoritmo de la division, calcula la division entera de dos numeros almacenandola en la variable i, y el resto en la variable x.
-- b) Calcula la cantidad de divisores positivos de un numero, almacenandolos en la variable i.

--Ejercicio 8
-- Evaluar un paso de ejecución en un programa.
evalStep :: Statement -> State -> (State , Continuation)
evalStep Skip e = (e,Finish)
evalStep AssignB x b e = (la_cambiar x b e,Finish)
evalStep AssignI x IntExpr e = (la_cambiar x b e,Finish)
evalStep Seq a b e = (a e, b)
evalStep If [(b,s)] e = ((head filter (x\ -> evalBExpr (fst x) e) ,Finish)
evalStep Do b s e = if evalBExpr == True then (s e, Do b s (s e) )
