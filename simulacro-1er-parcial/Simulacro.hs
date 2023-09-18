module Simulacro where
import Test.HUnit
-- Funciones auxiliares para ej 1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys)
    | x == y = True
    | otherwise = pertenece x ys

estaContenida :: (Eq t) => [t] -> [t] -> Bool
estaContenida [] ys = True
estaContenida (x:xs) ys = pertenece x ys && estaContenida xs ys

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = estaContenida xs ys && estaContenida ys xs

-- Ej 1
relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((a,b):xs)
    | pertenece (a,b) xs = False
    | pertenece (b,a) xs = False
    | a==b = False 
    | otherwise = relacionesValidas xs

-- Ej 2
personas :: [(String,String)] -> [String]
personas [] = []
personas ((a,b):xs)
    | pertenece a (personas xs) && pertenece b (personas xs) = personas xs
    | pertenece a (personas xs) = b:personas xs
    | pertenece b (personas xs) = a:personas xs
    | otherwise = a:b:personas xs

-- Ej 3
amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe persona ((a,b):xs)
    | persona == a = b:amigosDe persona xs
    | persona == b = a:amigosDe persona xs
    | otherwise = amigosDe persona xs

-- Funciones auxiliar para ej 4
-- apariciones devuelve un Int que representa la cantidad de veces que aparece una persona en la lista relaciones
apariciones :: String -> [(String,String)] -> Int
apariciones _ [] = 0
apariciones persona ((a,b):xs)
    | persona == a = 1 + apariciones persona xs
    | persona == b = 1 + apariciones persona xs
    | otherwise = apariciones persona xs

{- aparicionesDeCadaPersona, agarra una lista de personas, una lista de relaciones, y devuelve una lista de tuplas String Integer que tiene
el String es el mismo que el de personas y el integer es la cantidad de veces que aparece en relaciones
Por ej.: aparicionesDeCadaPersona ["Roberto","Mariano"] [("Roberto","Juan"),("Juan","Jose"),("Mariano","Roberto")]
devolveria [("Roberto",2),("Mariano",1)] pues Roberto aparece 2 veces y Mariano 1
-}
aparicionesDeCadaPersona :: [String] -> [(String,String)] -> [(String,Int)]
aparicionesDeCadaPersona [] _ = []    
aparicionesDeCadaPersona (persona:xs) relaciones = (persona,apariciones persona relaciones) : aparicionesDeCadaPersona xs relaciones

{-En aparicionesDeCadaPersonaEnRelaciones, lo que hago es agarrar la funcion anterior, pero en vez de pasarle como parametro cualquier
lista de personas, le mando como parametro (personas relaciones) es decir, todas las personas que aparecen en relaciones
por ej. aparicionesDeCadaPersonaEnRelaciones [("Pablo","Paula"),("Agustin","Javier"),("Pablo","Rafael")] devuelve
[("Paula",1),("Agustin",1),("Javier",1),("Pablo",2),("Rafael",1)]
-}
aparicionesDeCadaPersonaEnRelaciones :: [(String,String)] -> [(String,Int)]
aparicionesDeCadaPersonaEnRelaciones relaciones = aparicionesDeCadaPersona (personas relaciones) relaciones

{-
En personaConMasApariciones, agarro una lista del estilo de las que me genera aparicionesDeCadaPersonaEnRelaciones
o sea del tipo [("Roberto",2),("Mariano",1)] y devuelvo el S---------------------------- OTRA MANERA DE RESOLVERLO. NO ES MI RESPUESTA, ES PARA QUE ME QUEDE GUARDADO, PERO ERA MAS FACILtring que acompaña al mayor Int,
en este ejemplo devolveria "Roberto". Por supuesto, en caso de que haya 2 Ints iguales devolveria el String
que acompaña a alguno de ellos (por la manera en que esta hecho,en este caso seria el primero que aparezca en la lista)
-}
personaConMasApariciones :: [(String,Int)] -> String
personaConMasApariciones [(a,b)] = a
personaConMasApariciones ((persona1,apariciones1):(persona2,apariciones2):xs)
    | apariciones1 >= apariciones2 = personaConMasApariciones ((persona1,apariciones1):xs)
    | otherwise = personaConMasApariciones ((persona2,apariciones2):xs)

{-
En personaConMasAmigos le "doy de comer" a la ultima funcion, personaConMasApariciones, la lista
del tipo [(String,Int)] que surge de aplicarle aparicionesDeCadaPersonaEnRelaciones a la lista relaciones
Ejemplo: personaConMasAmigos [("Jorge","Maria"),("Jorge","Jose")] =  "Jorge"
         personaConMasAmigos [("Jorge","Maria"),("Jorge","Jose"),("Pablo","Jose"),("Pablo","Paula"),("Martin","Fausto"),("Fausto","Pablo")] = "Pablo"
Con eso, el problema queda resuelto
-}
personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos relaciones = personaConMasApariciones (aparicionesDeCadaPersonaEnRelaciones relaciones)






---------------------------- OTRA MANERA DE RESOLVERLO. NO ES MI RESPUESTA, ES PARA QUE ME QUEDE GUARDADO, PERO ERA MAS FACIL
cantidadDeAmigos :: String -> [(String,String)] -> Int
cantidadDeAmigos a b = length (amigosDe a b)
 
--- Esto es como persona con mas amigos pero pasandole una lista como parametro, para que de un resultado de esa lista 
mayorAmigueroAux :: [String]->[(String,String)]->String
mayorAmigueroAux [x] _ = x
mayorAmigueroAux (x:y:xs) relaciones
    | cantidadDeAmigos x relaciones >= cantidadDeAmigos y relaciones= mayorAmigueroAux (x:xs) relaciones
    | otherwise = mayorAmigueroAux (y:xs) relaciones

--- Esto es igual que antes, pero como le paso como parametro (personas relaciones) obligo a que la lista sean todos los elementos de relaciones
personaConMasAmigosV2 :: [(String,String)] -> String
personaConMasAmigosV2 relaciones = mayorAmigueroAux (personas relaciones) relaciones   

