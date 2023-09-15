---------EJERCICIO 1----------
--1
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--2
ultimo :: [t] -> t
ultimo (x:[])=x
ultimo (x:xs) = ultimo xs

--3
principio :: [t] -> [t]
principio (x:[]) = []
principio (x:xs) = x : principio xs

--4
reverso :: [t] -> [t]
reverso [] = []
reverso xs = ultimo xs : reverso (principio xs)

---------EJERCICIO 2----------
--1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys

--2
todosIguales ::  (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:xs) = x == head xs && todosIguales xs

--3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs) | pertenece x xs = False
                      | otherwise = todosDistintos xs

--4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise = hayRepetidos xs

--5
quitar::(Eq t)=>t->[t]->[t] -- Quito una vez sola el elemento
quitar e [] = []
quitar e (x:xs) | x == e = xs
                | otherwise = x:quitar e xs

--6
quitarTodos::(Eq t)=>t->[t]->[t] -- Quito todas las veces que aparezca el elemento
quitarTodos e [] = []
quitarTodos e (x:xs) | x == e = quitarTodos e xs
                     | otherwise = x:quitarTodos e xs

--7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x:eliminarRepetidos (quitarTodos x xs)
--Voy eliminando a todos los que esten repetidos, agarrando cada elemento, y borrando todas las veces adicionales que aparezca en la lista

--8
--estaContenida verifica si cada elemento de una lista xs pertenece a otra lista ys, es decir, si xs esta contenida en ys
estaContenida :: (Eq t) => [t] -> [t] -> Bool
estaContenida [] ys = True
estaContenida (x:xs) ys = pertenece x ys && estaContenida xs ys

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = estaContenida xs ys && estaContenida ys xs

--9
capicua :: (Eq t) => [t] -> Bool
capicua xs = xs == reverso xs

---------EJERCICIO 3----------
--1
sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--2
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

--3
maximo :: [Integer]->Integer
maximo [x] = x
maximo (x:y:xs) | x>y = maximo (x:xs)
                | otherwise = maximo (y:xs)

--4
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = (x+n) : sumarN n xs

--5
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero xs = sumarN primero xs
    where primero = head xs

--6
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo xs = sumarN (ultimo xs) xs

--7
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | even x = x:pares xs
             | otherwise = pares xs
-- Si es par lo "concateno" en la lista, si no no

--8
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] =  []
multiplosDeN n (x:xs) | mod x n == 0 = x:multiplosDeN n (xs)
                      | otherwise = multiplosDeN n (xs)
-- Es analogo a 'pares', pero en lugar de fijarme modulo 2, me fijo modulo n

--9
minimo :: [Integer]->Integer --Funcion auxiliar para ordenar
minimo [x] = x
minimo (x:y:xs) | x<y = minimo (x:xs)
                | otherwise = minimo (y:xs)

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar xs = minimo xs : ordenar (quitar (minimo xs) xs)
-- Agarro el minimo, lo pongo al principio de la lista, luego ordeno el resto de la lista sin ese minimo

---------EJERCICIO 3----------
--1
sacarEspaciosRepetidos :: [Char] -> [Char]
sacarEspaciosRepetidos [] = []
sacarEspaciosRepetidos (x:[])=[x]
sacarEspaciosRepetidos (x:y:xs) | x==y && x==' ' = sacarEspaciosRepetidos(y:xs)
                               | otherwise = x:(sacarEspaciosRepetidos(y:xs))

--2
--Aca voy a hacer un par de funciones auxiliares para contarPalabras
contarEspacios :: [Char] -> Integer
contarEspacios [] = 0
contarEspacios (x:xs) | x==' ' = 1 + contarEspacios xs
                      | otherwise = contarEspacios xs

sacarEspacioFin :: [Char] -> [Char]
sacarEspacioFin [] = []
sacarEspacioFin (x:[]) | x==' '=[] 
                       | otherwise = [x]
sacarEspacioFin (x:xs) = x:(sacarEspacioFin xs)
-- Si es el ultimo caracter y es un espacio, lo saco, si no no

sacarEspacioInicio :: [Char] -> [Char]
sacarEspacioInicio [] = []
sacarEspacioInicio (x:xs) | x == ' ' = xs
                          | otherwise = (x:xs)
-- Si es primer caracter es un espacio devuelvo el resto de la cadena, si no todo

limpiarCadena :: [Char] -> [Char]
limpiarCadena xs = sacarEspacioInicio (sacarEspacioFin (sacarEspaciosRepetidos xs))
-- Junto todas mis funciones para limpiar el String

contarPalabras :: [Char] -> Integer
contarPalabras xs = contarEspacios (limpiarCadena xs) + 1

-- 3
-- Aca voy a hacer un par de funciones auxiliares para palabras
primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (x:xs) | x ==' ' =[]
                      | otherwise = x:primeraPalabra xs
-- Devuelve la primera palabra de un String

sacarPrimeraPalabra :: [Char] -> [Char]
sacarPrimeraPalabra [] =[]
sacarPrimeraPalabra (x:xs) | x==' ' = xs
                           | otherwise = sacarPrimeraPalabra xs
-- Devuelve el String sin la primera palabra

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras xs = (primeraPalabra xs) : palabras (sacarPrimeraPalabra (limpiarCadena xs))
-- Devuelve las palabras en una lista palabras "Hola como andas" -> ["Hola","como","andas"]

-- 4
palabraMasLargaSinLimpiar :: [Char] -> [Char] 
palabraMasLargaSinLimpiar xs | sacarPrimeraPalabra xs == [] = primeraPalabra xs
                             | length (primeraPalabra xs) > length (palabraMasLargaSinLimpiar (sacarPrimeraPalabra xs)) = primeraPalabra xs
                             | otherwise = palabraMasLargaSinLimpiar (sacarPrimeraPalabra xs)

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = palabraMasLargaSinLimpiar (limpiarCadena xs)

--5
aplanar :: [[Char]]->[Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

--6
aplanarConEspacios :: [[Char]] -> [Char]
aplanarConEspacios [] = []
aplanarConEspacios (xs:[]) = xs ++ []
aplanarConEspacios (xs:xss) = (xs++" ") ++ aplanarConEspacios xss

--7
nEspacios :: Integer -> [Char]
nEspacios 0 = []
nEspacios n = ' ': nEspacios (n-1)
--nEspacios n = " "++ nEspacios (n-1) Vale tambien

aplanarConNEspacios :: [[Char]] -> Integer -> [Char]
aplanarConNEspacios [] n = []
aplanarConNEspacios (xs:[]) n = xs ++ []
aplanarConNEspacios (xs:xss) n = (xs ++ nEspacios n) ++ aplanarConNEspacios xss n

---------EJERCICIO 5----------
--1
sumatoriaHasta :: (Num t) => [t] -> Int -> t
sumatoriaHasta _ 0 = 0
sumatoriaHasta (x:xs) n = x + sumatoriaHasta xs (n-1)

sumaAcumuladaDesde :: (Num t)=>[t]->Int->[t]
sumaAcumuladaDesde (x:xs) m 
    | m <= length (x:xs) = sumatoriaHasta (x:xs) m : sumaAcumuladaDesde (x:xs) (m+1)
    | otherwise = []

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada xs = sumaAcumuladaDesde xs 1

--2
menorDivisorAux::Integer->Integer->Integer
menorDivisorAux a i  | mod a i == 0 =i
                     | otherwise = menorDivisorAux a (i+1)

menorDivisor::Integer->Integer
menorDivisor n = menorDivisorAux n 2
--La recursion de menorDivisorAux arranca en 2 y va subiendo hasta encontrar el primer múltiplo

factoresPrimos :: Integer -> [Integer]
factoresPrimos 1 = []
factoresPrimos n = menorFactor : factoresPrimos (div n menorFactor)
        where menorFactor = menorDivisor n

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = factoresPrimos x : descomponerEnPrimos xs

