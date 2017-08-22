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
pertenece y [] = False
pertenece y (x:xs) = x == y || pertenece y xs

--Ejercicio 4

encuentra :: Int -> [(Int, String)] -> String
encuentra y [] = ""
encuentra y ((a,b):xs) | a == y = b
                       | a /= y = encuentra y xs 

--Ejercicio 5

--a

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t

--b 

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t

--c

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = (t x) + (sumatoria' xs t)

--d

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = t x * productoria' xs t


--Ejercicio 6 PREGUNTAR: Si se puede usar funcion auxiliar

estrue :: Bool -> Bool
estrue x = x

paratodo'' :: [Bool] -> Bool
paratodo'' xs  = paratodo' xs estrue

--Ejercicio 7

--a 

esPar :: Int -> Bool
esPar x = x `mod` 2 == 0

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs esPar

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

--d PREGUNTAR: que pasa si en la lista no hay pares?
devolverPar :: Int -> Int
devolverPar x = (((x-1) `mod` 2) * (x-1)) + 1 

multiplicaPares :: [Int] -> Int
multiplicaPares xs = productoria' xs devolverPar