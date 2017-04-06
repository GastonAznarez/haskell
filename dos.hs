--Guia N°2

--Actividad 3

soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs) | mod x 2 == 0 = x:soloPares xs
		 | mod x 2 /=0 = soloPares xs

mayoresQue10 :: [Int] -> [Int]
mayoresQue10 [] = []
mayoresQue10 (x:xs) | x > 10 = x:mayoresQue10 xs
		    | x <= 10 = mayoresQue10 xs

mayoresQue :: Int -> [Int] -> [Int]
mayoresQue y [] = []
mayoresQue y (x:xs) | x > y = x:mayoresQue y xs
		    | x <= y = mayoresQue y xs

--Actividad 4

sumar1 :: [Int] -> [Int]
sumar1 [] = []
sumar1 (x:xs) = (x + 1):sumar1 xs

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (x*2):duplica xs

multiplica :: Int -> [Int] -> [Int]
multiplica y [] = []
multiplica y (x:xs) = (x*y):multiplica y xs


--Actividad 5

todosMenores10 :: [Int] -> Bool
todosMenores10 [] = True
todosMenores10 (x:xs) | x >= 10 = False
                      | x < 10 = todosMenores10 xs

hay0 :: [Int] -> Bool
hay0 [] = False
hay0 (x:xs) | x == 0 = True
            | x /= 0 = hay0 xs

suma :: [Int] -> Int
suma [] = 0
suma (x:xs) = x + (sum xs)



--Actividad 9

maximo :: [Int] -> Int
maximo [x] = x
maximo (x:(y:xs)) | x >= y = maximo (x:xs)
                  | x < y = maximo (y:xs) 

sumaPares :: [(Int,Int)] -> Int
sumaPares [] = 0
sumaPares ((x,y):xs) = (x + y) + (sumaPares xs)

todos0y1 :: [Int] -> Bool
todos0y1 [] = True
todos0y1 (x:xs) | x == 1 = todos0y1 xs
                | x == 0 = todos0y1 xs
                | not (x == 0 || x == 1) = False

quitar0s :: [Int] -> [Int]
quitar0s [] = []
quitar0s (x:xs) | x == 0 = quitar0s xs
                | x /= 0 = x:(quitar0s xs)


ultimo :: [a] -> a
ultimo (x:xs) | length xs == 0 = x
              | length xs /= 0 = ultimo xs 


repetir :: Int -> Int -> [Int]
repetir 0 x = []
repetir x y = y:(repetir (x-1) y)

concate :: [[a]] -> [a]
concate [] = []
concate (y:xs) = y++(concate xs)

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = (rev xs)++[x]











