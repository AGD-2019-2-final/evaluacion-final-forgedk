import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#    for line in sys.stdin:
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
    for line in sys.stdin:
        ##
        tuplas =  line.split(',')
        sys.stdout.write("{}\t{}\n".format(tuplas[3],tuplas[4]))

