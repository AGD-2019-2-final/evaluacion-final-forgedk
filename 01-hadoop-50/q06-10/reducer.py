import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    minValue = 1000
    maxValue = 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key,val = line.split("\t")

        if key == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            minValue = val if val < minValue else minValue
            maxValue = val if val > maxValue else maxValue
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
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, maxValue,minValue))

            curkey = key
            minValue = val
            maxValue = val

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, maxValue,minValue))