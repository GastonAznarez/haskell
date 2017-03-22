
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
