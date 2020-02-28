import sys
import operator
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0
    dictionary = {}

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
                total = val
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
                dictionary[curkey] = total

            curkey = key
            total = val
            dictionary[curkey] = total

    sorted_dictionary = sorted(dictionary.items(), key=operator.itemgetter(1))
    for key,value in sorted_dictionary:
        sys.stdout.write("{},{}\n".format(key, value))
