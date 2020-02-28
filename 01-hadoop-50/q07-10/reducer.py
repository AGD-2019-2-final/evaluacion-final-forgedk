import sys
import operator
#
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
            dictV[date] = [key,(int(valor))]

        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if curkey is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sorted_dictionary = sorted(dictV.items(), key=operator.itemgetter(1))
                for loyal,value in sorted_dictionary:
                    sys.stdout.write("{}\t{}\t{}\n".format(value[0], loyal,value[1]))

            curkey = key
            dictV ={}
            dictV[date] = [key,(int(valor))]

    sorted_dictionary = sorted(dictV.items(), key=operator.itemgetter(1))
    for loyal,value in sorted_dictionary:
       sys.stdout.write("{}\t{}\t{}\n".format(value[0], loyal,value[1]))