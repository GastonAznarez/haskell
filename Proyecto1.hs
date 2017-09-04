--Ejercicio 1

esCero :: Int -> Bool
esCero x = x == 0

esPositivo :: Int -> Bool
esPositivo x = x > 0

esVocal :: Char -> Bool
esVocal x = x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u'

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x-1)

promedio :: [Int] -> Int
promedio [] = 0
promedio (xs) = (sumatoria xs) `div` (length xs)

--Ejercicio 2

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = (x && paratodo xs)

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

--Ejercicio 3

pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece y (x:xs) = x == y || pertenece y xs

--Ejercicio 4

encuentra :: Int -> [(Int, String)] -> String
encuentra _ [] = ""
encuentra y ((a,b):xs) | a == y = b
                       | otherwise = encuentra y xs

--Ejercicio 5

--a

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] _ = True
paratodo' (x:xs) t = t x && paratodo' xs t

--b

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] _ = False
existe' (x:xs) t = t x || existe' xs t

--c

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] _ = 0
sumatoria' (x:xs) t = (t x) + (sumatoria' xs t)

--d

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] _ = 1
productoria' (x:xs) t = t x * productoria' xs t


--Ejercicio 6

paratodo'' :: [Bool] -> Bool
paratodo'' xs  = paratodo' xs ( == True)

--Ejercicio 7

--a

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs even

--b

esMultiplo :: Int -> Int -> Bool
esMultiplo x y = y `mod` x == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo x xs = existe' xs (esMultiplo x)

--c

cuadrado :: Int -> Int
cuadrado x = x*x

sumaMultiplos :: Int -> Int
sumaMultiplos x = sumatoria' [1..x] cuadrado

--d
devolverPar :: Int -> Int
devolverPar x = (((x-1) `mod` 2) * (x-1)) + 1

multiplicaPares :: [Int] -> Int
multiplicaPares xs = 1 * ( productoria' xs devolverPar )

-- Ejercicio 8

--a

--A la función map se le da una lista xs y una función f, y devuelve una lista ys obtenida de aplicar la función f a cada elemento de la lista xs.
-- map :: (a -> b) -> [a] -> [b]

--A la función filter se le da un predicado p y una lista xs y devuelve una lista con tods los elementos de xs que satisfacen p.
-- filter :: (a -> Bool) -> [a] -> [a]

--b

--La expresió map succ [1, -4, 6, 2, -8], donde succ n = n+1; equivale a aplicarle la función succ a cada elmento. Da como resultado [2, -3, 7, 3, -7]

--c

--La función filter esPositivo [1, -4, 6, 2, -8] devuelve la lista con los números son positivos, [1, 6, 2].


-- Ejercicio 9

porDos :: Int -> Int
porDos x = x*2

dooble :: [Int] -> [Int]
dooble [] = []
dooble (x:xs) = (2*x) : (dooble xs)

dooble' :: [Int] -> [Int]
dooble' xs = map porDos xs

-- Ejercicio 10

--a

losPares :: [Int] -> [Int]
losPares [] = []
losPares (x:xs) | even x = x : losPares xs
                | otherwise = losPares xs

--b

losPares' :: [Int] -> [Int]
losPares' xs = filter even xs

--c

multiplicaPares' :: [Int] -> Int
multiplicaPares' xs = productoria (filter even xs)

-- Ejercicio 11

--a

sumarALista :: Num a => a -> [a] -> [a]
sumarALista _ [] = []
sumarALista y (x:xs) = y + x : sumarALista y xs

encabezar :: a -> [[a]] -> [[a]]
encabezar _ [] = []
encabezar y (x:xs) = (y:x) : encabezar y xs

mayoresA :: Ord a => a -> [a] -> [a]
mayoresA _ [] = []
mayoresA y (x:xs) | x > y = x : mayoresA y xs
                  | otherwise = mayoresA y xs

--b

sumarALista' :: Num a => a -> [a] -> [a]
sumarALista' y xs = map ( + y) xs

encabezar' :: a -> [[a]] -> [[a]]
encabezar' y xs = map (y:) xs

mayoresA' :: Ord a => a -> [a] -> [a]
mayoresA' y xs = filter ( y < ) xs

-- Ejercicio 12

encuentra' :: Int -> [(Int,String)] -> String
encuentra' _ [] = ""
encuentra' x xs = snd (head (filter ( (==x).fst ) xs ))

-- Ejercicio 13

-- a

primIgualesA :: Int -> [Int] -> [Int]
primIgualesA _ [] = []
primIgualesA y (x:xs) | y == x = x : primIgualesA y xs
                      | otherwise = []

-- b

primIgualesA' :: Int -> [Int] -> [Int]
primIgualesA' y xs = takeWhile ( == y) xs

-- Ejercicio 14

-- a

primIguales :: [Int] -> [Int]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:xs) | head xs == x = x : primIguales xs
                   | otherwise = [x]

-- b

primIguales' :: [Int] -> [Int]
primIguales' xs = primIgualesA' (head xs) xs

-- Ejercicio 15

-- a

minimo :: Ord a => [a] -> a
minimo [x] = x
minimo (x:xs) = min x (minimo xs)

-- b

minimo' :: (Ord a, Bounded a) => [a] -> a
minimo' [] = minBound
minimo' [x] = x
minimo' (x:xs) = min x (minimo' xs)


-- Ejercicios extras versión Gastón

nuts = 1:(map (+1) nuts)

primos = 2: (filter f xs)

  where
    f n = length [x | x <- [2..(n-1)], n `mod` x == 0 ] == 0
    xs = takeWhile (>2) (tail (tail nuts))


prim :: [Int]
prim = filtro [2..]
--Tambien se puede usar (tail(tail nuts)) pero me parece mejor esta forma

filtro :: [Int] -> [Int]
filtro (p:xs) = p : filtro [x | x <- xs, x `mod` p /= 0]
