import sys
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    dictV = {}

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
        key,date,valor = line.split("\t")

        if curkey == key:
            
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            dictV[key+date] = [key,date,int(valor)]

        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            curkey = key
            dictV[key+date] = [key,date,int(valor)]

    sorted_dictionary = sorted(dictV.items(), key=lambda e : e[1][2])
    contador = 0
    for loyal,value in sorted_dictionary:
        if contador < 6:
            contador+=1
            sys.stdout.write("{}\t{}\t{}\n".format(value[0], value[1],value[2]))