module Language.ListaAsoc where

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
                          | otherwise = (Nodo b c (la_cambiar a e d))
