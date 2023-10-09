--Funcion auxiliar para el ejercicio 1
recuentoDeVotosPositivos :: [Int] -> Int
recuentoDeVotosPositivos [] =  0
recuentoDeVotosPositivos (x:xs) = x + recuentoDeVotosPositivos xs

--EJERCICIO 1
votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int
votosEnBlanco _ votosPositivos votosTotales = votosTotales - (recuentoDeVotosPositivos votosPositivos)

----------------------------------------------------------
{-
perteneceElementoTupla nos dice si determinado String esta en alguna tupla
de una lista de tuplas, por ej 
perteneceElementoTupla "Milei" [("Milei","Villarruel"),("Massa","Rossi")] = True pues esta Milei
perteneceElementoTupla "Bullrich" [("Milei","Villarruel"),("Massa","Rossi")] = False pues no esta Bullrich
-}
perteneceElementoTupla :: String -> [(String,String)] -> Bool
perteneceElementoTupla e [] = False
perteneceElementoTupla e ((a,b):xs)
    | e == a = True
    | e == b = True
    | otherwise = perteneceElementoTupla e xs     

--EJERCICIO 2
formulasValidas :: [(String,String)] -> Bool
formulasValidas [] = True
formulasValidas ((a,b):xs)
    | a == b = False
    | perteneceElementoTupla a xs = False
    | perteneceElementoTupla b xs = False
    | otherwise = formulasValidas xs

----------------------------------------------------------
division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

{-cantidadDeVotos me da la cantidad de votos del candidato que paso como input-}
cantidadDeVotos :: String -> [(String,String)] -> [Int] -> Int
cantidadDeVotos presidente ((candidato,vice):xs) (votos:ys)
    | presidente == candidato = votos
    | otherwise = cantidadDeVotos presidente xs ys

--EJERCICIO 3
porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeVotos presidente formulas votos = division ((cantidadDeVotos presidente formulas votos)*100) (recuentoDeVotosPositivos votos)

-----------------------------------------------------------------------------
{- Aca pongo dos veces la lista formulas, porque una de ellas la modifico (voy sacando candidatos), y la otra no    
   Si pusiera  una vez sola la lista formulas estaría perdiendo datos al hacer la recursión, asi que uso esto para evitar ese problema
-}
proximoPresidenteAux :: [(String,String)] -> [(String,String)] -> [Int] -> String
proximoPresidenteAux ((candidato,vice):[]) _ _ = candidato
proximoPresidenteAux ((candidato1,vice1):(candidato2,vice2):xs) formulas votos
    | votosCandidato1 >= votosCandidato2 = proximoPresidenteAux ((candidato1,vice1):xs) formulas votos
    | otherwise = proximoPresidenteAux ((candidato2,vice2):xs) formulas votos
    where
        votosCandidato1 = cantidadDeVotos candidato1 formulas votos
        votosCandidato2 = cantidadDeVotos candidato2 formulas votos

--EJERCICIO 4
proximoPresidente :: [(String,String)] -> [Int] -> String
proximoPresidente formulas votos = proximoPresidenteAux formulas formulas votos
-- Llamo a la funcion auxiliar usando dos veces la lista formulas (como habiamos dicho antes) 