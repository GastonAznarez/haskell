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
