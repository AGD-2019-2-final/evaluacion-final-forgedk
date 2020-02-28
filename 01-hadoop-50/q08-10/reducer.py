import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    numeroDeElementos = 0
    total = 0
    

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
            numeroDeElementos += 1
            total += float(valor)
            

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

                sys.stdout.write("{}\t{}\t{}\n".format(curkey,total, total/numeroDeElementos))

            curkey = key
            total = float(valor)
            numeroDeElementos = 1

    sys.stdout.write("{}\t{}\t{}\n".format(curkey,total, total/numeroDeElementos))