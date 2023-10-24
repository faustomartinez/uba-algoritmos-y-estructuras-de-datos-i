#Ejercicio 1
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

#Ejercicio 2
def clonar_sin_comentarios(nombre_archivo:str):
    archivo=open(nombre_archivo,'r')
    archivo_sin_comentarios = open("clon.py","w")
    lineas=archivo.readlines()
    for linea in lineas:
        if not linea.strip()[0]=="#":
            archivo_sin_comentarios.write(linea)
    archivo.close()
    archivo_sin_comentarios.close()

#Ejercicio 3
def invertir_texto(nombre_archivo:str):
    archivo=open(nombre_archivo,'r')
    lineas=archivo.readlines()
    lineas_al_reves=lineas[::-1]
    reverso = open('reverso.txt','w')
    for linea in lineas_al_reves:
        reverso.write(linea)
    archivo.close()
    reverso.close()


#Ejercicio 4
#https://recursospython.com/guias-y-manuales/lectura-y-escritura-de-archivos/
def agregar_frase(nombre_archivo:str,frase:str):
    archivo=open(nombre_archivo,'a')
    archivo.write(frase)
    archivo.close()

#Ejercicio 5
def agregar_frase_principio(nombre_archivo:str,frase:str):
    archivo = open(nombre_archivo,'r+')
    contenido = archivo.read()
    archivo.seek(0,0)
    archivo.write(frase.rstrip('\r\n') + '\n' + contenido)

#Ejercicio 6
def binario_to_legible(nombre_archivo:str):
    return 0

#Ejercicio 7
def promedioEstudiante(lu:str)->float:
    return 10

#Ejercicio 21
def frecuencias(nombre_archivo:str)->dict:
    archivo = open(nombre_archivo,'r',encoding='utf8')
    frec:dict={}# inicializando/creando el diccionario
    for linea in archivo.readlines(): # ['a hola agruparPorLongitud\n', 'otra linea\n']
        palabras = linea.split()      # ['a', 'hola', 'chau']
        for palabra in palabras:
            if palabra in d:
                # la palabra ya existe
                # entonces incremento en 1 la cantidad de apariciones
                d[palabra] = d[palabra] + 1
            else:
                # aparece por primera vez palabra
                # la agrego al diccionario
                d[palabra] = 1

    archivo.close()
    return d

def la_palabra_mas_frecuente(nombre_archivo : str) -> str:
    d = frecuencias(nombre_archivo)
    palabraMasFrecuente: str
    frecuenciaMax: int = 0
    
    for palabra, frecuencia in d.items():
        if frecuencia > frecuenciaMax:
            frecuenciaMax = frecuencia
            palabraMasFrecuente = palabra
    
    return palabraMasFrecuente