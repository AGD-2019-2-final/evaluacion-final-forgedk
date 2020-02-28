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
        ## genera las tuplas palabra \tabulador 1
        ## ya que es un conteo de palabras
        ##
        for word in line.split(','):

            ##
            ## escribe al flujo estandar de salida
            ##
            if (word in ['credit_history','critical','delayed','fully repaid','fully repaid this bank','repaid']):
                sys.stdout.write("{}\t1\n".format(word))