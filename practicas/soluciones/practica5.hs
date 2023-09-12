---------EJERCICIO 1----------
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: [t] -> t
ultimo (x:[])=x
ultimo (x:xs) = ultimo xs

principio :: [t] -> [t]
principio (x:[]) = []
principio (x:xs) = x : principio xs

reverso :: [t] -> [t]
reverso [] = []
reverso xs = ultimo xs : reverso (principio xs)

---------EJERCICIO 2----------
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys

todosIguales ::  (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:xs) = x == head xs && todosIguales xs

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs) | pertenece x xs = False
                      | otherwise = todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise = hayRepetidos xs

quitar::(Eq t)=>t->[t]->[t] -- Quito una vez sola el elemento
quitar e [] = []
quitar e (x:xs) | x == e = xs
                | otherwise = x:quitar e xs

quitarTodos::(Eq t)=>t->[t]->[t] -- Quito todas las veces que aparezca el elemento
quitarTodos e [] = []
quitarTodos e (x:xs) | x == e = quitarTodos e xs
                     | otherwise = x:quitarTodos e xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x:eliminarRepetidos (quitarTodos x xs)
--Voy eliminando a todos los que esten repetidos, agarrando cada elemento, y borrando todas las veces adicionales que aparezca en la lista

--estaContenida verifica si cada elemento de una lista xs pertenece a otra lista ys, es decir, si xs esta contenida en ys
estaContenida :: (Eq t) => [t] -> [t] -> Bool
estaContenida [] ys = True
estaContenida (x:xs) ys = pertenece x ys && estaContenida xs ys

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = estaContenida xs ys && estaContenida ys xs

capicua :: (Eq t) => [t] -> Bool
capicua xs = xs == reverso xs
---------EJERCICIO 3----------
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

maximo :: [Integer]->Integer
maximo [x] = x
maximo (x:y:xs) | x>y = maximo (x:xs)
                | otherwise = maximo (y:xs)

sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = (x+n) : sumarN n xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero xs = sumarN primero xs
    where primero = head xs

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo xs = sumarN (ultimo xs) xs

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | even x = x:pares xs
             | otherwise = pares xs
-- Si es par lo "concateno" en la lista, si no no

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] =  []
multiplosDeN n (x:xs) | mod x n == 0 = x:multiplosDeN n (xs)
                      | otherwise = multiplosDeN n (xs)
-- Es analogo a 'pares', pero en lugar de fijarme modulo 2, me fijo modulo n

minimo :: [Integer]->Integer --Funcion auxiliar para ordenar
minimo [x] = x
minimo (x:y:xs) | x<y = minimo (x:xs)
                | otherwise = minimo (y:xs)

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar xs = minimo xs : ordenar (quitar (minimo xs) xs)
-- Agarro el minimo, lo pongo al principio de la lista, luego ordeno el resto de la lista sin ese minimo