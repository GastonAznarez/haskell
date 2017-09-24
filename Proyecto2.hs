-- Cargo y Area son tipos enumerados
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar
data Area = Administrativa | Ensenanza | Economica | Postgrado
--Rol es un tipo algebraico
data Rol = Decanx -- constructor sin argumento
          | Docente Cargo -- constructor con un argumento
          | NoDocente Area -- constructor con un argumento

data Persona = Per String String Int Int Int Int Rol

--Ejercicio 5
data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b )
                            deriving (Show)

type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String
type Guia = ListaAsoc String Int

la_long :: Integral c => ListaAsoc a b -> c
la_long Vacia = 0
la_long (Nodo a b p) = 1 + la_long p

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia Vacia = Vacia
la_concat Vacia (Nodo a b p) = Nodo a b (la_concat Vacia p)
la_concat (Nodo a b p) s = Nodo a b (la_concat p s )

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b p) = [(a,b)] ++ la_pares p

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo a b p) c | a == c = Just b
                        | otherwise = la_busca p c

--Ejercicio 6

getName :: Persona -> String
getName (Per a _ _ _ _ _ _) = a

data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a )
  deriving (Show)

a_long :: Integral b => Arbol a -> b
a_long Hoja = 0
a_long (Rama a b c) = 1 + (a_long a) + (a_long c)

a_hojas :: Integral b => Arbol a -> b
a_hojas Hoja = 0
a_hojas (Rama Hoja _ Hoja) = 1
a_hojas (Rama a _ c) = a_hojas a + a_hojas c

a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama a c b) = Rama (a_inc a) (c+1) (a_inc b)

a_inc' :: Num a => Arbol a -> Arbol a
a_inc' a = a_map (+1) a

a_nombre :: Arbol Persona -> Arbol String
a_nombre Hoja = Hoja
a_nombre (Rama a b c) = Rama (a_nombre a) (getName b) (a_nombre c)

a_nombre' :: Arbol Persona -> Arbol String
a_nombre' a = a_map getName a

a_map :: (a -> b) -> Arbol a -> Arbol b
a_map _ Hoja = Hoja
a_map f  (Rama a b c) = Rama (a_map f a) (f b) (a_map f c)

a_sum :: Num a => Arbol a -> a
a_sum Hoja = 0
a_sum (Rama a b c) = b + a_sum a + a_sum c

a_prod :: Num a => Arbol a -> a
a_prod Hoja = 1
a_prod (Rama a b c) = b * a_prod a * a_prod c
