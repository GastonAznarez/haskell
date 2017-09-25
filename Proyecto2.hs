--Ejercicio 1

data Carrera = Matematica | Fisica | Computacion | Astronomia | Profesorado
    deriving (Eq, Show)

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Ciencias de la Computacion"
titulo Astronomia = "Licenciatura en Astronomia"
titulo Profesorado = "Profesorado"

--Se puede definiendo el tipo Carrera como Eq
titulo' :: Carrera -> String
titulo' x | x == Matematica = "Licenciatura en Matematica"
          | x == Fisica = "Licenciatura en Fisica"
          | x == Computacion = "Licenciatura en Ciencias de la Computacion"
          | x == Astronomia = "Licenciatura en Astronomia"
          | x == Profesorado = "Profesorado"
          | otherwise = "No es una carrera"


--Ejercicio 2

type Ingreso = Int

data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar
    deriving(Eq, Show)

data Area = Administrativa | Ensenanza | Economica | Postgrado
    deriving(Eq, Show)

-- El Constructor docente es de tipo Cargo -> Rol

esDocenteC :: Cargo -> Rol -> Bool
esDocenteC x (Docente c) = x == c
esDocenteC _ _ = False

cuantos_doc :: [Rol] -> Cargo -> Int
cuantos_doc [] _ = 0
cuantos_doc (x:xs) c = cuantos_doc xs c
cuantos_doc ((Docente x):xs) c | x == c = 1 + cuantos_doc xs c
                               | otherwise = cuantos_doc xs c

cuantos_doc' :: [Rol] -> Cargo -> Int
cuantos_doc' xs c = length ( filter(\x -> esDocenteC c x ) xs )

data Rol = Decanx
    | Docente Cargo
    | NoDocente Area
    | Estudiante [Carrera] Ingreso
    deriving(Eq, Show)

estudia :: Rol -> Carrera -> Bool
estudia (Estudiante [] y) z = False
estudia (Estudiante (x:xs) y) z = x == z || estudia (Estudiante xs y) z
estudia _ _ = False

--Ejercicio 3

data Persona = Per String String Int Int Int Int Rol
     deriving (Eq,Show)

edad :: Persona -> (Int,Int,Int) -> Int
edad (Per _ _ _ x y z _ ) (a,b,c) | c < z = error ("No nacio aun")
                                  | b < y || b == y && a < x  = c-z-1
                                  | otherwise = c-z

existe :: String -> [Persona] -> Bool
existe x [] = False
existe x ((Per _ b _ _ _ _ _ ):xs) = x == b || existe x xs

est_astronomia :: [Persona] -> [Persona]
est_astronomia [] = []
est_astronomia ((Per x y z h m n a ):xs) | estudia a Astronomia  = (Per x y z h m n a ): est_astronomia xs
                                         | otherwise = est_astronomia xs

esNoDocente :: Rol -> Bool
esNoDocente (NoDocente x) = True
esNoDocente _ = False

padron_NoDocente :: [Persona] -> [(String,Int)]
padron_NoDocente [] = []
padron_NoDocente ((Per x y z h m n a ):xs) | esNoDocente a = (x++" "++y,z): padron_NoDocente xs
                                           | otherwise = padron_NoDocente xs

--Ejercicio 4

data Cola = Vacia | Encolada Persona Cola
    deriving(Eq, Show)

atender :: Cola -> Cola
atender Vacia = Vacia
atender (Encolada x y) = y

encolar :: Persona -> Cola -> Cola
encolar x Vacia = Encolada x Vacia
encolar x (Encolada z s) = Encolada z (encolar x s)

busca :: Cola -> Cargo -> Persona
busca Vacia x = error ("No hay nadie con este cargo en la cola")
busca (Encolada (Per a b d e f g h) xs) c | esDocenteC c h = (Per a b d e f g h)
                                          | otherwise = busca xs c

-- El tipo Cola se parece a......

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
