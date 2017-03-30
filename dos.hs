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
							 				| x:todosMenores10 xs
