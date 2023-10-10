##Primera Parte
#Ejercicio 1.1
def pertenece(e:int,seq:[int])->bool:
    for i in range (0,len(seq),1):
        if (e==seq[i]):
            return True
    return False
def pertenece(e:int,seq:[int])->bool:
    i:int=0
    while i<len(seq):
        if(e==seq[i]):
            return True
        i+=1
    return False
def pertenece(e:int,seq:[int])->bool:
    i=len(seq)-1
    while i>=0:
        if(e==seq[i]):
            return True
        i-=1
    return False

#Ejercicio 1.2
def divideATodos(e:int,seq:[int])->bool:
    for i in range(0,len(seq)):
        if (not (seq[i]%e==0)):
            return False
    return True

#Ejercicio 1.3
def sumaTotal(seq:[int])->int:
    contador:int=0
    for i in range(0,len(seq)):
        contador+=seq[i]
    return contador

#Ejercicio 1.4
def ordenados(seq:[int])->bool:
    for i in range(0,len(seq)-1):
        if (not(seq[i]<seq[i+1])):
            return False
    return True

#Ejercicio 1.5
def hayPalabrasLargas(seq:[str])->bool:
    for i in range(0,len(seq)):
        if(len(seq[i])>7):
            return True
    return False

#Ejercicio 1.6
def esPalindromo(palabra:str)->bool:
    l:int=len(palabra)
    for i in range(0,l//2):
        if(palabra[i]!=palabra[(l-1)-i]):
            return False
    return True

#Ejercicio 1.7
def hay_numero(palabra:str)->bool:
    for caracter in palabra:
        if (caracter>='0') and (caracter<='9'):
            return True
    return False
def hay_mayuscula(palabra:str)->bool:
    for caracter in palabra:
        if (caracter>='A') and (caracter<='Z'):
            return True
    return False
def hay_minuscula(palabra:str)->bool:
    for caracter in palabra:
        if (caracter>='a') and (caracter<='z'):
            return True
    return False

def fortalezaContraseña(contraseña:str)->str:
    long:int=len(contraseña)
    if(long<5):
        return "ROJA"
    elif(long>8 and hay_numero(contraseña) and hay_minuscula(contraseña) and hay_mayuscula(contraseña)):
        return "VERDE"
    else:
        return "AMARILLA"

#Ejercicio 1.8
def saldoActual(operaciones:[(str,float)])->float:
    saldo:float=0
    long:int=len(operaciones)
    for i in range (0,long):
        if(operaciones[i][0]=='I'):
            saldo+=operaciones[i][1]
        elif(operaciones[i][0]=='R'):
            saldo-=operaciones[i][1]
    return saldo

#Ejercicio 1.9
def vocalesDistintas(palabra:str)->bool:
    contadorVocalesDistintas:int=0
    long=len(palabra)
    if(pertenece('a',palabra) or pertenece('A',palabra)):
        contadorVocalesDistintas+=1
    if(pertenece('e',palabra) or pertenece('E',palabra)):
        contadorVocalesDistintas+=1
    if(pertenece('i',palabra) or pertenece('I',palabra)):
        contadorVocalesDistintas+=1
    if(pertenece('o',palabra) or pertenece('O',palabra)):
        contadorVocalesDistintas+=1
    if(pertenece('u',palabra) or pertenece('U',palabra)):
        contadorVocalesDistintas+=1
    return contadorVocalesDistintas>=3

##Segunda parte
#2.1
def borrarPosicionesPares (lista:[int]) -> [int]:
    for i in range (0,len(lista)):
        if(i%2==0):
            lista[i]=0
    return lista

#2.2
def borrarPosicionesPares2 (lista:[int]) -> [int]:
    output:[int]=[]
    for i in range(0,len(lista)):
        if (i%2==0):
            output.append(0)
        else:
            output.append(lista[i])
    return output

#2.3
def es_vocal(letra:str)->bool:
    return (letra=='a') or (letra=='A') or (letra=='e') or (letra=='E') or (letra=='i') or (letra=='I') or (letra=='o') or (letra=='O') or (letra=='u') or (letra=='U')

def borrarVocales(palabra:str)->str:
    salida:str=""
    for i in range(0,len(palabra)):
        if (not(es_vocal(palabra[i]))):
            salida+=palabra[i]
    return salida

#2.4
def reemplazaVocales(palabra:[chr])->[chr]:
    salida:[chr]=[]
    for i in range(0,len(palabra)):
        if (es_vocal(palabra[i])):
            salida+=" "
        else:
            salida+=palabra[i]
    return salida

#2.5
def daVueltaStr(palabra:[chr])->[chr]:
    salida:[chr]=[]
    long=len(palabra)
    for i in range(0,long):
        salida+=palabra[long-i-1]
    return salida

#2.6
def eliminarRepetidos(palabra:[chr])->[chr]:
    salida:[chr]=[]
    long=len(palabra)
    for i in range (0,long):
        if (palabra[i] not in salida):
            salida.append(palabra[i])
    return salida

#3
def promedio(notas:[int])->float:
    sumaNotas:int=0
    for nota in notas:
        sumaNotas+=nota
    promedio:float=sumaNotas/len(notas)
    return promedio

def todasLasNotasSonMayoresQue4(notas:[int])->bool:
    for nota in notas:
        if nota<4:
            return False
    return True

def aprobado(notas:[int])->int:
    if (todasLasNotasSonMayoresQue4(notas) and promedio(notas)>=7):
        return 1
    elif (todasLasNotasSonMayoresQue4(notas) and 4<=promedio(notas)<7):
        return 2
    elif (not(todasLasNotasSonMayoresQue4(notas)) or promedio(notas)<4):
        return 3

#4.1
def listaDeEstudiantes()->[str]:
    res:[str]=[]
    nombre=""
    while(nombre!="listo"):
        print("Ingrese un nombre: ")
        nombre=input()
        if(nombre!='listo'):
            res.append(nombre)
    return res

#4.2
def historialSube() -> [(str,int)]:
    res:[(str,int)]=[]
    opcion:str=""
    monto:int=0
    plataActual:int=0
    while(opcion!='X'):
        print("Ingrese una opción(C: Cargar, D: Descontar, X=Cerrar):")
        opcion=input()
        if(opcioninput=='C'):
            print("Ingrese un monto:")
            monto=int(input())
            plataActual+=monto
            res.append((opcion,monto))
        elif(opcion=='D'):
            print("Ingrese un monto:")
            monto=int(input())
            plataActual-=monto
            res.append((opcion,monto))
    print("Terminó con "+str(plataActual)+" pesos")        
    return res

#4.3
import random
def juego7ymedio() -> [int]:
    historialDeCartas:[int]=[]
    opcion:str='S'
    contador:int=0
    while(opcion=='S' and contador<=7.5):
        print("----")
        num:int=random.choice([1,2,3,4,5,6,7,10,11,12])
        print("Te toco un "+str(num))
        historialDeCartas.append(num)
        if(num==10 or num==11 or num==12):
            contador+=0.5
        else:
            contador+=num

        if(contador>7.5):
            print('Contador= '+str(contador)+' =>PERDISTE')
            opcion='X'
        elif(contador==7.5):
            print('Contador= '+str(contador)+' =>GANASTE')
            opcion='X'
        else:
            print('Contador= '+str(contador)+' =>(S para seguir, X para parar)')
            opcion=input()
    return historialDeCartas

#5.1
def perteneceACadaUno (e:int,s:[[int]],res:[bool])->None:
    res=[]
    for i in range (0,len(s)):
        res.append(pertenece(e,s[i]))

#5.2
def esMatriz(input:[[int]])->bool:
    for i in range (0,len(input)):
        if (len(input)!=len(input[i])):
            return False
    return True

#5.3
def filasOrdenadas(m:[[int]],res:[bool])->None:
    res=[]
    for i in range (0,len(m)):
        if (not ordenados(m[i])):
            res.append(False)
        else:
            res.append(True)
    print(res)

#5.4
import numpy as np
def elevarMatriz(dim:int,pot:int)->[[int]]:
    matriz=np.random.randint(0,10,(dim,dim))
    return np.linalg.matrix_power(matriz,pot)


