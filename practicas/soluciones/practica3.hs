import Text.XHtml (base, caption)
---------EJERCICIO 1--------------
f1::Int->Int
f1 n | n==1 =8
    | n==4 =131
    | n==16 =16
    --Hola loco q tal

g1::Int->Int
g1 n | n==8 =16
    | n==16 =4
    | n==131 =1

h1::Int->Int
h1 x = f (g x)

k1::Int->Int
k1 x = g (f x)

-------EJERCICIO 2-------------------
absoluto::Int->Int
absoluto = abs

maximoabsoluto::Int->Int->Int
maximoabsoluto x y|abs x >= abs y = abs x
                  |otherwise = abs y

maximo3::Int->Int->Int->Int
maximo3 x y z|x>=y && x>=z =x
             |y>=x && y>=z =y
             |z>=x && z>=y =z

algunoEs0::Float->Float->Bool
algunoEs0 0 _ = True
algunoEs0 _ 0 = True
algunoEs0 _ _ = False

algunoEs0Bis::Float->Float->Bool
algunoEs0Bis x y = x==0 || y== 0

ambosSon0::Float->Float->Bool
ambosSon0 0 0 = True
ambosSon0 _ _ = False

ambosSon0Bis::Float->Float->Bool
ambosSon0Bis x y = x==0 && y==0

mismoIntervalo::Float->Float->Bool
mismoIntervalo x y = (x<=3 && y<=3) || ((x>3 && x<=7)&&(y>3 && y<=7)) || (x>7 && y>7)

sumaDistintos::Int->Int->Int->Int
sumaDistintos x y z|x==y && y==z =0
                   |x==y =z
                   |x==z =y
                   |y==z =x
                   |otherwise =x+y+z

esMultiploDe::Int->Int->Bool
esMultiploDe x y = mod x y ==0

digitoUnidades::Int->Int
digitoUnidades x = mod x 10

digitoDecenas::Int->Int
digitoDecenas x = digitoUnidades (div x 10)


--------EJERCICIO 3-------------
estanRelacionados::Int->Int->Bool
estanRelacionados x y| mod x y ==0 =True
                     | otherwise = False

--------EJERCICIO 4---------------
productoInterno::(Float,Float)->(Float,Float)->Float
productoInterno (a,b) (c,d) = a*c+b*d

todoMenor::(Float,Float)->(Float,Float)->Bool
todoMenor (a,b) (c,d) = a<c && b<d

distanciaPuntos::(Float,Float)->(Float,Float)->Float
distanciaPuntos (a,b) (c,d)=sqrt ((c-a)^2+(d-b)^2)

sumaTerna::(Float,Float,Float)->Float
sumaTerna (a,b,c) = a+b+c

sumarSoloMultiplos::(Int,Int,Int)->Int->Int
sumarSoloMultiplos (a,b,c) d | mod a d == 0 && mod b d == 0 && mod c d == 0 = a+b+c
                             | mod a d == 0 && mod b d == 0 && mod c d /= 0 = a+b
                             | mod a d == 0 && mod b d /= 0 && mod c d == 0 = a+c
                             | mod a d /= 0 && mod b d == 0 && mod c d == 0 = b+c
                             | mod a d == 0 && mod b d /= 0 && mod c d /= 0 = a
                             | mod a d /= 0 && mod b d == 0 && mod c d /= 0 = b
                             | mod a d /= 0 && mod b d /= 0 && mod c d == 0 = c
                             | otherwise = 0

posPrimerPar::(Int,Int,Int)->Int
posPrimerPar (a,b,c) | even a =0
                     | even b =1
                     | even c =2
                     | otherwise =4

crearPar:: a->b->(a,b)
crearPar a b = (a,b)

invertir::(a,b)->(b,a)
invertir (a,b)=(b,a)

----------EJERCICIO 5-----------------
todosMenores::(Int,Int,Int)->Bool
todosMenores (a,b,c) = f a > g a && f b > g b && f c > g c

f::Int->Int
f n | n <= 7 =n^2
    | otherwise = 2*n-1

g::Int->Int
g n | even n = div n 2
    | otherwise =3*n+1

-----------EJERCICIO 6--------------------
bisiesto::Int->Bool
bisiesto año = mod año 4 == 0 && mod año 100 /= 0 || mod año 400 ==0

-----------EJERCICIO 7--------------------
distanciaManhattan::(Float,Float,Float)->(Float,Float,Float)->Float
distanciaManhattan (a,b,c) (d,e,f) = abs (d-a) + abs (e-b) + abs (f-c)

-----------EJERCICIO 8--------------------
comparar::Int->Int->Int
comparar x y | sumaUltimosDosDigitos x > sumaUltimosDosDigitos y = -1
              | sumaUltimosDosDigitos x < sumaUltimosDosDigitos y = 1
              | otherwise =0

sumaUltimosDosDigitos::Int->Int
sumaUltimosDosDigitos x = digitoDecenas x + digitoUnidades x

-----------EJERCICIO 9-------------------
{-
a)
* f1 devuelve 1 si la entrada es 0, y 0 si no

problema f1 (n:Float):Float{
    asegura res=0 <-> n/=0
    asegura res=1 <-> n==0
}

b)
* f2 devuelve 15 si n==1 y -15 si n==-1
problema f2(n:Float):Float{
    requiere n==1 || n==-1
    asegura res==15 <-> n==1
    asegura res==-15 <-> n==-1
}

c)
*f3 devuelve 7 si n<=9 y 5 si n>=3 (en realidad, si n>9 a efectos practicos)
problema f3(n:Float):Float{
    asegura res==7 <-> n<=9
    asegura res==5 <-> n>=3
}

d)
*f4 devuelve el promedio entre dos numeros reales
problema f4(x,y:Float):Float{
    asegura res es el promedio entre x e y
}

e) 
*f5 devuelve el promedio entre dos numeros de una 2-upla de numeros reales, es decir RxR
problema f5((x,y):Float x Float):Float{
    asegura res es el promedio entre x e y
}

f)
*f5 devuelve true si la parte entera de un real es igual a otro entero, y false si no
problema f6(x:Float, y:Int):Bool{
    asegura res=True <-> La parte entera de x es y
}
-}
