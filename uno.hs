
--Trabajo en clase 19/03

f x = 5 * x

duplica a = a + a

por2 y = y * 2

multiplicar zz tt = zz * tt

signo::Int -> Int
signo x | x == 0 = 0
        | x > 1 = 1
        | x < 1 = -1

--Actividad 16

entre0y9::Int -> Bool
entre0y9 x = x<10 && x>(-1)

rangoPrecio::Int -> String
rangoPrecio x   | x<0 = "esto no puede ser!"
                | x<2000 = "muy barato"
                | x>5000 = "demaciado caro"
                | x>2000 && x<5000 = "hay que venderlo"

absoluto::Int -> Int
absoluto x   | x<0 = (-x)
             | x>0 = x
             | x == 0 = 0

esMultiplo2:: Int -> Bool
esMultiplo2 x = mod x 2 == 0

--Actividad 17-22

esMultiploDe:: Int->Int->Bool
esMultiploDe x y = mod y x == 0

esBisiesto:: Int->Bool
esBisiesto x | mod x 400 == 0 = True
             | (mod x 4 == 0 && not( mod x 100 == 0)) = True
             | otherwise = False

dispercion:: Int->Int->Int->Int
dispercion x y z = (max(max x y) z) - (min (min x y) z)

celsiusToFahr:: Fractional a => a -> a
celsiusToFahr x = x * 1.8 + 32

fahrToCelsius:: Fractional a => a -> a
fahrToCelsius x = (x - 32) / 1.8

haceFrioF:: Float -> Bool
haceFrioF x = (fahrToCelsius x) < 8
