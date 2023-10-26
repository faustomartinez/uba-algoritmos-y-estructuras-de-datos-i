## Archivos
#*Ejercicio 1
def contar_lineas(nombre_archivo:str)->int:
    archivo = open (nombre_archivo,"r")
    sumador:int=0
    for linea in archivo.readlines():
        sumador+=1
    archivo.close()
    return sumador

def existe_palabra(palabra:str,nombre_archivo:str)->bool:
    result=False
    archivo=open(nombre_archivo,"r")
    for linea in archivo.readlines():
        if palabra in linea:
            result=True
    return result

def cantidad_apariciones(nombre_archivo:str,palabra:str)->int:
    sumador:int=0
    archivo=open(nombre_archivo,'r')
    contenidoDelArchivo=archivo.read()
    palabrasDelArchivo=contenidoDelArchivo.split()
    for palabraDelArchivo in palabrasDelArchivo:
        if palabra==palabraDelArchivo:
            sumador+=1
    return sumador

#*Ejercicio 2
def clonar_sin_comentarios(nombre_archivo:str):
    archivo=open(nombre_archivo,'r')
    archivo_sin_comentarios = open("clon.py","w")
    lineas=archivo.readlines()
    for linea in lineas:
        if not linea.strip()[0]=="#":
            archivo_sin_comentarios.write(linea)
    archivo.close()
    archivo_sin_comentarios.close()

#*Ejercicio 3
def invertir_texto(nombre_archivo:str):
    archivo=open(nombre_archivo,'r')
    lineas=archivo.readlines()
    lineas_al_reves=lineas[::-1]
    reverso = open('reverso.txt','w')
    for linea in lineas_al_reves:
        reverso.write(linea)
    archivo.close()
    reverso.close()


#*Ejercicio 4
#https://recursospython.com/guias-y-manuales/lectura-y-escritura-de-archivos/
def agregar_frase(nombre_archivo:str,frase:str):
    archivo=open(nombre_archivo,'a')
    archivo.write(frase)
    archivo.close()

#*Ejercicio 5
def agregar_frase_principio(nombre_archivo:str,frase:str):
    archivo = open(nombre_archivo,'r+')
    contenido = archivo.read()
    archivo.seek(0,0)
    archivo.write(frase.rstrip('\r\n') + '\n' + contenido)

#*Ejercicio 6 (No termine de entenderlo)
def binario_to_legible(nombre_archivo:str):
    archivo = open(nombre_archivo,'rb')
    contenido=archivo.read()
    res:[str]=[]
    for linea in contenido:
        caracter:str=chr(linea)
        if (caracter>'A' and caracter<'Z') or (caracter>'a' and caracter<'z') or (caracter==' ') or (caracter=='_') :
            res.append(chr(linea))
    print(res)

#*Ejercicio 7
def promedioEstudiante(lu:str)->float:
    archivo=open('notas.csv','r')
    lineas=archivo.readlines()
    contador:int=0
    notaAcumulada:int=0
    for linea in lineas:
        datos=linea.split(",")
        if datos[0]==lu:
            contador+=1
            notaAcumulada+=int(datos[3])
    promedio:float = notaAcumulada/contador
    return promedio

##* Pilas
#*Ejercicio 8
from queue import LifoQueue as Pila
import random

def generar_nros_al_azar(n:int,desde:int,hasta:int)->Pila:
    p:Pila = Pila()
    for i in range(0,n):
        p.put(random.randint(desde,hasta))
    return p

#*Ejercicio 9
def cantidad_elementos(p:Pila)->int:
    contenido=[]
    contador:int=0
    while not p.empty():
        contenido.append(p.get())
        contador+=1
    for elemento in contenido[::-1]:
        p.put(elemento)
    return contador

"""#p=Pila()
p.put(1)
p.put(2)
p.put(3)
print(cantidad_elementos(p))
#Esto para chequear que la pila sigue igual que al principio
while not p.empty():
    print(p.get())#"""

#*Ejercicio 10
def buscar_el_maximo(p:Pila)->int:
    maximo:int=p.get()
    while not p.empty():
        nuevo_elemento=p.get()
        if nuevo_elemento > maximo:
            maximo=nuevo_elemento
    return maximo

#*Ejercicio 11
def esta_bien_balanceada(s:str)->bool:
    res:bool=True
    p=Pila()
    parentesis_abiertos:int=0
    for letra in s[::-1]:
        p.put(letra)
    while not p.empty():
        letra_sacada=p.get()
        if letra_sacada=="(":
            parentesis_abiertos+=1
        if letra_sacada==")":
            parentesis_abiertos-=1
        if parentesis_abiertos<0:
            res=False
    if parentesis_abiertos>0:
        res=False
    return res

"""#print(
esta_bien_balanceada("3*(1x2)-(5-4)"),
esta_bien_balanceada("7((2x7)"),
esta_bien_balanceada("8*(9/3))")
)"""

#*Ejercicio 12
def evaluar_expresion(expresion:str)->str:
    operandos=Pila()
    tokens=expresion.split(" ")
    print(tokens)
    for token in tokens:
        if '0'<token<'9':
            operandos.put(token)
        elif token in ['+','-','*','/']:
            n2=int(operandos.get())
            n1=int(operandos.get())
            if token=='+':
                operandos.put(n1+n2)
            if token=='-':
                operandos.put(n1-n2)
            if token=='*':
                operandos.put(n1*n2)
            if token=='/':
                operandos.put(n1/n2)
    return operandos.get()

#print(evaluar_expresion("3 4 + 5 * 2 -"))

##* Colas
#* Ejercicio 13
from queue import Queue as Cola
def generar_nros_al_azar_cola(n:int,desde:int,hasta:int)->Cola:
    c=Cola()
    p:Pila=generar_nros_al_azar(n,desde,hasta)
    for i in range (0,n):
        c.put(p.get())
    return c

"""c:Cola=generar_nros_al_azar_cola(5,1,10)
while not c.empty():
    print(c.get())"""

#*Ejercicio 14
def cantidad_elementos(c:Cola)->int:
    contenido=[]
    contador:int=0
    while not c.empty():
        contenido.append(c.get())
        contador+=1
    for elemento in contenido:
        c.put(elemento)
    return contador

"""c=Cola()
c.put(1)
c.put(2)
c.put(3)
c.put(4)
print(cantidad_elementos(c))
#Esto es para chequear que la cola sigue igual que al principio
while not c.empty():
    print(c.get())"""

#*Ejercicio 15
def buscar_el_maximo(c:Cola)->int:
    maximo:int=c.get()
    while not c.empty():
        nuevo_elemento=c.get()
        if nuevo_elemento > maximo:
            maximo=nuevo_elemento
    return maximo

"""c=Cola()
c.put(9)
c.put(2)
c.put(7)
c.put(4)
print(buscar_el_maximo(c))"""

#*Ejercicio 16
def armar_secuencia_de_bingo()->Cola[int]:
    lista:list[int]=list(range(1,100))
    random.shuffle(lista)
    cola:Cola[int]=Cola()
    for elemento in lista:
        cola.put(elemento)
    return cola

def jugar_carton_del_bingo(carton:list,bolillero:Cola[int])->int:
    jugadas:int=0
    numeros_marcados:int=0
    bolillero_aux:Cola[int]=Cola()

    #Sigo sacando bolillas hasta que marque todos los numeros
    while numeros_marcados<12:
        bolilla_sacada=bolillero.get()
        bolillero_aux.put(bolilla_sacada)
        if bolilla_sacada in carton:
            numeros_marcados+=1
        jugadas+=1

    #Una vez que marque todos, paso todas las bolillas restantes al bolillero auxiliar
    while not bolillero.empty():
        bolilla_sacada:int = bolillero.get()
        bolillero_aux.put(bolilla_sacada)

    #Luego las devuelvo del bolillero auxiliar al original, para que quede igual que al principio        
    while not bolillero_aux.empty():
        bolilla_sacada:int  = bolillero_aux.get()
        bolillero.put(bolilla_sacada)

    return jugadas

#print(jugar_carton_del_bingo([1,20,21,50,71,22,41,28,9,77,51,91],armar_secuencia_de_bingo()))

#* Ejercicio 17
def n_pacientes_urgentes(cola:Cola[(int,str,str)])->int:
    contador:int=0
    cola_aux:Cola[(int,str,str)]=Cola()
    while not cola.empty():
        paciente:(int,str,str)=cola.get()
        cola_aux.put(paciente)
        if paciente[0] in [1,2,3]:
            contador+=1
    while not cola_aux.empty():
        paciente:(int,str,str)=cola_aux.get()
        cola.put(paciente)
    return contador

"""cola=Cola()
cola.put((1,'Jorge','ahi anda'))
cola.put((1,'Maria','esta jodida'))
cola.put((5,'Alejandro','blabla'))
cola.put((4,'Martin','Anda bien dentro de todo'))
print(n_pacientes_urgentes(cola))"""

#*Ejercicio 18
def _a_clientes(cola:Cola[(str,int,bool,bool)])->Cola[(str,int,bool,bool)]:
    cola_prioridades:Cola[(str,int,bool,bool)]=Cola()
    cola_preferenciales:Cola[(str,int,bool,bool)]=Cola()
    cola_resto:Cola[(str,int,bool,bool)]=Cola()
    cola_ordenada:Cola[(str,int,bool,bool)]=Cola()
    cola_aux:Cola[(str,int,bool,bool)]=Cola()

    while not cola.empty():
        cliente:(str,int,bool,bool)=cola.get()
        cola_aux.put(cliente)
        if cliente[3]:
            cola_prioridades.put(cliente)
        elif cliente[2]:
            cola_preferenciales.put(cliente)
        else:
            cola_resto.put(cliente)

    while not cola_aux.empty():
        cliente:(str,int,bool,bool)=cola_aux.get()
        cola.put(cliente) 
    
    while not cola_prioridades.empty():
        cola_ordenada.put(cola_prioridades.get())
    while not cola_preferenciales.empty():
        cola_ordenada.put(cola_preferenciales.get())
    while not cola_resto.empty():
        cola_ordenada.put(cola_resto.get())
    
    return cola_ordenada

"""cola=Cola()
cola.put(('Jorge',19391293,False,False))
cola.put(('Andrea',11523351,True,False))
cola.put(('Adelina',7976723,False,True))
cola.put(('Roberto',12452413,True,False))
cola_ordenada=_a_clientes(cola)
while not cola_ordenada.empty():
    print(cola_ordenada.get())"""