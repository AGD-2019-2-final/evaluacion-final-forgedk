import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
    for line in sys.stdin:
        ##
        tuplas =  line.split('\t')
        sys.stdout.write("{}\t{}".format(tuplas[0],tuplas[1]))