import GHC.Int (neInt32)
import Language.Haskell.TH (Lit(IntegerL))
-------------EJERCICIO 1---------------
fibonacci::Int->Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

-------------EJERCICIO 2---------------
parteEntera::Float->Int
--parteEntera=truncate
parteEntera x | x<1 && x>=0 =0
              | x>(-1) && x<=0 = -1
              | x>=1 = 1+parteEntera (x-1)
              | otherwise =(-1)+parteEntera (x+1)

-------------EJERCICIO 3---------------
{-
problema esDivisible(x,y : Z):Bool{
    requiere {x>0 AND y>0}
    asegura {(res=true)<->El primer numero es divisible por el segundo}
}
-}

modulo::Int->Int->Int
modulo a b | a>=0 && a<b = a
           | otherwise = modulo (a-b) b

esDivisible::Int->Int->Bool
esDivisible a b = modulo a b == 0

-------------EJERCICIO 4---------------
sumaImpares::Int->Int
sumaImpares 1 = 1
sumaImpares a = sumaImpares (a-1) + 2

-------------EJERCICIO 5---------------
medioFact::Integer->Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact (n-2)

-------------EJERCICIO 6---------------
sumaDigitos::Int->Int
sumaDigitos n | n < 10 = n
              | otherwise = rem n 10 + sumaDigitos (div n 10)

-------------EJERCICIO 7---------------
todosDigitosIguales::Int->Bool
todosDigitosIguales n | n<10 = True
                      | n<100 = rem n 10==div n 10
                      | otherwise = todosDigitosIguales (rem n 100) && todosDigitosIguales (div n 10)

-------------EJERCICIO 8---------------
cantDigitos::Integer->Integer
cantDigitos n | n<10 =1
              | otherwise = 1+cantDigitos (sacarUltimo n)
              where sacarUltimo n = div n 10

iesimoDigito::Integer->Integer->Integer
iesimoDigito n i | i == cantDigitos n = ultimoDigito n
                 | otherwise = iesimoDigito (sacarUltimo n) i
                 where sacarUltimo n = div n 10
                       ultimoDigito n = mod n 10
-- mod n 10 -> me da el ultimo digito d en
-- div n 10 -> Le saca el ultimo digito a n

-------------EJERCICIO 9---------------
{-
problema esCapicua(n:Z):Bool{
    requiere {n>0}
    asegura {(res==true)<->n es capicua}
}
-}
inverso::Integer->Integer
inverso = read . reverse . show
--show pasa de Integer a String, reverse da vuelta un string, y read pasa String a Int

esCapicua::Integer->Bool
esCapicua n = n==inverso n

-------------EJERCICIO 10--------------
{-
problema f1(n:Z):Z{
    requiere {n>=0}
    asegura {res=2^n-1}
}
-}
f1::Integer->Integer
f1 0=1
f1 n=2^n + f1 (n-1)

{-
problema f2(n:Z,q:ℝ):ℝ{
    requiere{n>0}
    asegura {res=q^(n+1)-q / q-1} si q/=1
    asegura {res=n} q=1
}
-}
f2::Integer->Float->Float
f2 1 q = q
f2 n q = q^n + f2 (n-1) q
-- f2 n q = q^(n+1)-q / q-1

{-
problema f3(n:Z,q:ℝ):ℝ{
    requiere{n>0}
    asegura {res=q^2(n+1)-q^2 / q^2-1} si q/=1
    asegura {res=n+1} q=1
}
-}

f3::Integer->Float->Float
f3 n  = f2 (2*n) 

{-
problema f4(n:Z,q:ℝ):ℝ{
    requiere{n>0}
    asegura {res=q^(2*n+1)-q^n / q^n-1} si q/=1
    asegura {res=n+1} q=1
}
-}

f4::Integer->Float->Float
f4 n q = f2 (2*n) q - f2 (n-1) q

-------------EJERCICIO 11--------------
{-
problema eAprox(n:Z):ℝ{
    requiere {n>0}
    asegura {res=una aproximacion del numero e con la serie 1/i!}
}
-}
(!)::Integer->Integer
(!) 0 = 1
(!) n = n * ((n-1) !)

eAprox::Integer->Float
eAprox 1 = 2
eAprox n = 1/fromIntegral (n !) + eAprox (n-1)

e :: Float
e = eAprox 10

-------------EJERCICIO 12--------------
{-
problema raizDe2Aprox(n:Z):ℝ{
    requiere {n>0}
    asegura {res=una aproximacion de la raiz de 2 con la serie [2 + 1/a(n-1)] y restandole 1}
}
-}
f::Integer->Float
f 1 = 2
f n = 2 + 1/f (n-1)

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = f n - 1

-------------EJERCICIO 13--------------
{-
problema sumatoriaDoble(n,m:Z):Z{
    requiere {n>0}
    requiere {m>0}
    asegura {res=sum desde i=1 hasta n sum desde j=1 hasta m de i^j}
}
-}

sumatoriaDoble :: Integer->Integer->Integer
sumatoriaDoble 0 _ = 0
sumatoriaDoble n m = sumatoriaSimple n m + sumatoriaDoble (n-1) m 

sumatoriaSimple::Integer->Integer->Integer
sumatoriaSimple _ 0 = 0
sumatoriaSimple I j  = I^j + sumatoriaSimple I (j-1)

-------------EJERCICIO 14--------------
primerSumaPotencias::Integer->Integer->Integer
primerSumaPotencias q 0 = 0
primerSumaPotencias q n = q^n + primerSumaPotencias q (n-1)

sumaPotencias::Integer->Integer->Integer->Integer
sumaPotencias 0 _ _ = 0
sumaPotencias q n m = primerSumaPotencias q m * primerSumaPotencias q n

-------------EJERCICIO 15--------------
sumaRacionales::Integer->Integer->Float
sumaRacionales 0 _ = 0
sumaRacionales n m = sumaRacionalesAux n m + sumaRacionales (n-1) m

sumaRacionalesAux::Integer->Integer->Float
sumaRacionalesAux _ 0 = 0
sumaRacionalesAux n m = fromIntegral n / fromIntegral m + sumaRacionalesAux n (m-1)

-------------EJERCICIO 16--------------
menorDivisorAux::Integer->Integer->Integer
menorDivisorAux a i  | mod a i == 0 =i
                     | otherwise = menorDivisorAux a (i+1)

menorDivisor::Integer->Integer
menorDivisor n = menorDivisorAux n 2
--La recursion de menorDivisorAux arranca en 2 y va subiendo hasta encontrar el primer múltiplo

esPrimo::Integer->Bool
esPrimo n = n == menorDivisor n

--Algoritmo de Euclides
mcd :: Integer -> Integer -> Integer
mcd a 0 = a
mcd a b = mcd b (rem a b)

sonCoprimos::Integer->Integer->Bool
sonCoprimos n m = mcd n m == 1

nEsimoPrimo::Integer->Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = siguientePrimo (nEsimoPrimo (n-1))
-- Devuelve el primo nº n, 
-- Ej: nEsimoPrimo 4 = 7, nEsimoPrimo5=11 , nEsimoPrimo 19=67

siguientePrimo::Integer->Integer
siguientePrimo n | esPrimo (n+1) = n+1
                 | otherwise = siguientePrimo (n+1)
-- Si el siguiente numero es primo, devuelve ese numero, si no, vuelve a chequear hasta tener uno primo
-- Ej: siguientePrimo 3 = 5, siguientePrimo 5=7, siguientePrimo 6=7

-------------EJERCICIO 17--------------
esFibonacciAux::Integer->Integer->Integer->Bool
esFibonacciAux n fibAnterior fib
    | fib == n = True
    | fib > n = False
    | otherwise = esFibonacciAux n fib (fib+fibAnterior) -- Esto pues en la siguiente iteracion fibAnterior es fib, y fib es (fib+fibAnterior) por def de Fibonacci

esFibonacci :: Integer->Bool
esFibonacci n = esFibonacciAux n 0 1 --Con 0 y 1 arranco la secuencia de Fibonacci. Prendo la chispa de la recursion

-------------EJERCICIO 18--------------
mayorDigitoPar::Integer->Integer
mayorDigitoPar n | n<10 && even n = n
                 | n<10 && odd n = -1
                 | even ultimoDigito = max ultimoDigito (mayorDigitoPar nRecortado)
                 | otherwise = mayorDigitoPar nRecortado
                  where ultimoDigito = mod n 10
                        nRecortado = div n 10

-------------EJERCICIO 19--------------
sumaPrimosHasta::Integer->Integer
sumaPrimosHasta 1 = 2
sumaPrimosHasta n = nEsimoPrimo n + sumaPrimosHasta (n-1)
-- sumaPrimosHasta cuenta los primeros n primos

esSumaInicialDePrimosDesde :: Integer-> Integer->Bool
esSumaInicialDePrimosDesde m 1 = False
esSumaInicialDePrimosDesde m n | sumaPrimosHasta m == n = True
                               | sumaPrimosHasta m > n = False
                               | sumaPrimosHasta m < n = esSumaInicialDePrimosDesde (m+1) n
{-esSumaInicialDePrimosDesde va chequeando desde cierto m si el n que me dieron es igual
a la suma de primos hasta m. Si esta suma de primos supera a n, devuelve false,
Si esta suma de primos es igual a n, devuelve true (pues quiere decir que n es suma de primos)
Si esta suma de primos es menor que n, buscamos la siguiente suma de primos
-}

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos = esSumaInicialDePrimosDesde 1
---Arrancamos la recursion desde 1, para cubrir todos los casos

-------------EJERCICIO 20--------------
sumaDivisoresHasta :: Integer -> Integer -> Integer
sumaDivisoresHasta n 1 = 1
sumaDivisoresHasta n k | mod n k == 0 = k + sumaDivisoresHasta n (k-1)
                       | otherwise = sumaDivisoresHasta n (k-1)
--- Si k divide a n, lo voy agregando, si no lo hace, continuo la recursion sin sumar

sumaDivisores::Integer->Integer 
sumaDivisores n = sumaDivisoresHasta n n
----Sumo hasta el maximo divisor, que es el mismo numero

valorMaxHasta::Integer->Integer
valorMaxHasta 1 = 1
valorMaxHasta n = max (sumaDivisores n) (valorMaxHasta (n-1))

--Encadeno en max's las sumas de divisores desde n1 hasta n2
{-
Ej valorMax 8 11 = max 15 (valorMax 9 11) = max 15 (max 13 (valorMax 10 11))
= max 15 (max 13 (max 18 (valor Max 11 11))) = max 15 (max 13 (max 18 12))=
    max 15 (max 13 18) = max 15 18 = max 18 = 18 = sumaDivisores 10
-}
valorMax :: Integer -> Integer -> Integer
valorMax n1 n2 | n1/=n2 = max (sumaDivisores n1) (valorMax (n1+1) n2)
               | otherwise = sumaDivisores n1 

-------------EJERCICIO 21--------------
--Funcion para chequear si determinados p,q,r cumplen la condicion de p²+q²=r²
esMenorPitagoriano :: Integer->Integer->Integer->Bool
esMenorPitagoriano p q r = p^2 + q^2 <= r^2

pitagorasNFijo :: Integer -> Integer -> Integer -> Integer
pitagorasNFijo n m r | m<0 = 0
                     | esMenorPitagoriano n m r = 1 + pitagorasNFijo n (m-1) r
                     | otherwise = 0 + pitagorasNFijo n (m-1) r
--Voy sumando uno solo si se cumple la condicion pedida, al llegar a 0 termino

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras n m r | n==0 = pitagorasNFijo 0 m r
                | otherwise = pitagorasNFijo n m r + pitagoras (n-1) m r
-- Voy haciendo pitagoras con n fijo de cada n hasta llegar a n=0
