import math

#Ejercicio 1
def imprimir_hola_mundo() -> None:
    print("¡Hola mundo!")

def imprimir_un_verso() -> None:
    print("Los amigos del barrio pueden desaparecer\nLos cantores de radio pueden desaparecer\nLos que están en los diarios pueden desaparecer\nLa persona que amas puede desaparecer")

def raizDe2() -> float:
    return round(math.sqrt(2),4)

def factorial_de_2() -> int:
    return math.factorial(2)

def perimetro() -> float:
    return 2*(math.pi)

#Ejercicio 2

def imprimir_saludo(nombre:str) -> None:
    print("Hola "+nombre)

def raiz_cuadrada_de(numero:float)->float:
    return math.sqrt(numero)

def fahrenheit_a_celsius(temp_far:float)->float:
    return ((temp_far-32)*5)/9

def imprimir_dos_veces(estribillo:str)->None:
    print(estribillo*2)

def es_multiplo_de(n:int,m:int)->bool:
    return (n%m==0)

def es_par(n:int)->bool:
    return(es_multiplo_de(n,2))

def cantidad_de_pizzas(comensales:int,min_cant_de_porciones:int)->int:
    return math.ceil((comensales*min_cant_de_porciones)/8)

#Ejercicio 3

def alguno_es_0(numero1:float,numero2:float)->bool:
    return (numero1==0) or (numero2==0)

def ambos_son_0(numero1:float,numero2:float)->bool:
    return (numero1==0) and (numero2==0)

def es_nombre_largo(nombre:str)->bool:
    return 3<=len(nombre)<=8

def es_bisiesto(año:int)->bool:
    return (año%4==0) and ((año%100!=0) or (año%400==0))

#Ejercicio 4

#Altura en cm, Peso en kg
def peso_pino(altura:int)->int:
    if(altura<=300):
        return altura*3
    else:
        return 900+2*(altura-300)

def es_peso_util(peso:int)-> bool:
    return 400<=peso<=1000

def sirve_pino(altura:int)->bool:
    return es_peso_util(peso_pino(altura))

#Ejercicio 5

def devolver_el_doble_si_es_par(numero:int)->int:
    if (es_par(numero)):
        return 2*numero
    else:
        return numero

def devolver_valor_si_es_par_sino_el_que_sigue(numero:int)->int:
    if(es_par(numero)):
        return numero
    else:
        return numero+1

def devovler_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero:int)->int:
    if(es_multiplo_de(numero,9)):
        return 3*numero
    elif(es_multiplo_de(numero,3)):
        return 2*numero
    else:
        return numero
    
def lindo_nombre(nombre:str)->str:
    if (len(nombre)>=5):
        return "¡Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"

def elRango(numero:int)->None:
    if(numero<5):
        print("Menor a 5")
    elif(10<=numero<=20):
        print("Entre 10 y 20")
    elif(numero>20):
        print("Mayor a 20")

def laburo(genero:str,edad:int):
    if (genero=="F"):
        if(18<=edad<60):
            print("Te toca trabajar")
        else:
            print("Andá de vacaciones")
    elif(genero=="M"):
        if(18<=edad<65):
            print("Te toca trabajar")
        else:
            print("Andá de vacaciones")

#Ejercicio 6

def numeros_1_al_10() -> None:
    i=1
    while (i<=10):
        print(i)
        i+=1

def numeros_10_al_40() -> None:
    i=10
    while (i<=40):
        print(i)
        i+=2

def eco() -> None:
    i=1
    while(i<=10):
        print("Eco")
        i+=1

def cohete(numero:int)->None:
    while (numero>=1):
        print(numero)
        numero-=1
    print ("Despegue")

def viajeEnElTiempo(añoSalida:int,añoLlegada:int)->None:
    añoSalida-=1
    while(añoSalida>=añoLlegada):
        print("Viajó un año al pasado, estamos en el año "+str(añoSalida))
        añoSalida-=1

def conocerAAristoteles(añoDeSalida:int)->None:
    while(añoDeSalida>=384):
        print("Viajó 20 años al pasado, estamos en el "+str(añoDeSalida))
        añoDeSalida-=20
    if(añoDeSalida>=374):
        print("Viajó 20 años al pasado, estamos en el "+str(añoDeSalida))

#Ejercicio 7

def numeros_del_1_al_10_v2() -> None:
    for i in range(1,11,1):
        print(i)

def numeros_del_10_al_40_v2() -> None:
    for i in range(10,41,2):
        print(i)

def eco_v2() -> None:
    for i in range (0,10,1):
        print("Eco")

def cohete_v2(numero:int) -> None:
    for i in range (0,numero,1):
        print(numero)
        numero-=1
    print("Cohete")

def viajeEnElTiempo_v2(añoDeSalida:int,añoDeLlegada:int)->None:
    for i in range(añoDeLlegada,añoDeSalida,1):
        print("Viajó un año al pasado, estamos en el año "+str(añoDeSalida))
        añoDeSalida-=1

def conocerAAristoteles_v2(añoDeSalida:int):
    for i in range(384,añoDeSalida,20):
        print("Viajó 20 años al pasado, estamos en el "+str(añoDeSalida))
        añoDeSalida-=20
    if(añoDeSalida>=374):
        print("Viajó 20 años al pasado, estamos en el "+str(añoDeSalida))

#Ejercicio 8

def rt(x:int,g:int) -> int:
    g=g+1
    return x+g
#----
g:int =0
def ro(x:int) -> int:
    global g
    g=g+1
    return x+g

# si aplico ro(1) 3 veces seguidas, me va a devolver 2,3 y 4 respectivamente,
# pues la variable es global
# si aplico rt(1,0) siempre estoy pasando g=0, en cambio en ro pase primero
# g=0, luego g=1, y luego g=2, pues la variable es global    

#problema rt (inout x:Int, inout g:Int) -> Int{
#   asegura{result=x+g+1}
# }

#problema ro (inout x:Int) -> Int{
#   asegura{result=x+1 y cada vez que llame a esta funcion, va a sumar 1 mas}
# }
    
