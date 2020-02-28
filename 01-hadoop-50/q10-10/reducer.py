import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    dictV = {}

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
        key,valor = line.split("\t")
        valor = valor.rstrip()
     
        if curkey == key:
            
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            
            for letra in  valor.split(","):
                if letra not in dictV:
                    dictV[letra] = []  
                dictV[letra].append(int(curkey))

        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            curkey = key
            for letra in  valor.split(","):
                if letra not in dictV:
                    dictV[letra] = []  
                dictV[letra].append(int(curkey))
            
    dictVOrdenado = sorted(dictV.items(), key=lambda e : e[0])
    for lista in dictVOrdenado:
        listaOrd  =(lista[1])
        listaOrd.sort()
        stringElementos = ""
        for elemento in listaOrd:
            if stringElementos =="":
               stringElementos = stringElementos + str(elemento)
            else:
                stringElementos = stringElementos + ","+str(elemento)
        
        sys.stdout.write("{}\t{}\n".format(lista[0], stringElementos))