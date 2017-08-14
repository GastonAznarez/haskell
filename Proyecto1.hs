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
promedio (xs) | (sumatoria xs) ´div´ (lenght xs)

--Ejercicio 2

paratodo :: [Bool] -> Bool
paratodo [] = true
paratodo (x:xs) = (x && paratodo xs)

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

--Ejercicio 3

pertenece :: Int -> [Int] -> Bool
pertenece [] = false
pertenece y (x:xs) = x == y || pertenece y xs

--Ejercicio 4

encuentra :: Int -> [(Int, String)] -> String
encuentra y [] = ''
encuentra y ((a,b):xs) | a == y = b
			| a != y = encuentra y xs 

--Ejercicio 5

--a

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = true
paratodo' (x:xs) t = t x && paratodo' xs t

--b 

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = false
existe' (x:xs) t = t x || paratodo' xs t

--c

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = t x + sumatoria xs

--d

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 0
productoria' (x:xs) t = t x + sumatoria xs 


--Ejercicio 6

estrue :: Boll -> Bool
estrue x = x

paratodo'' :: [Bool] -> Bool
paratodo'' xs  = paratodo' xs estrue
