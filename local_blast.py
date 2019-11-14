import subprocess as sbp
import argparse

def local_blast(input:str, blocksize:int, db:str, eval:float, output:str):
    """
    a draft function for parallelizing BLAST launnches
    will be improved over time
    """
    
    sbp.run(f"cat {input} | parallel --block {blocksize}k --recstart '>'
    --pipe blastp -evalue {eval} -outfmt 6 -db {db} -query -", shell=True, stdout = output)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', type=str, required=True )
    parser.add_argument('-s', help='split block size', type=str, required=True)
    parser.add_argument('-db', help='BLAST database name', type=str, required=True)
    parser.add_argument('-e', help='e-value cutoff', type=float, required=True)
    parser.add_argument('-o', help='path to output file', type=str, required=False)

    args = parser.parse_args()
    i, s, db,e, o = args.i, args.s, args.db, args.e, args.o
    if o is None:
        o = sbp.STDOUT
    local_blast(i, s, db, e, o)
