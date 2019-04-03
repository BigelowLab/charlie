# ANI Calculation

The quickest way to calculate ANI is with [FastANI](https://github.com/ParBLiSS/FastANI). It is available as a module. To load:

```text
module use /mod/scgc
module load fastani
```

FastANI instructions:

```text
$ fastANI --help
-----------------
fastANI is a fast alignment-free implementation for computing whole-genome
Average Nucleotide Identity (ANI) between genomes
-----------------
Example usage:
$ fastANI -q genome1.fa -r genome2.fa -o output.txt
$ fastANI -q genome1.fa --rl genome_list.txt -o output.txt

Available options
-----------------
-h, --help
    Print this help page

-r <value>, --ref <value>
    reference genome (fasta/fastq)[.gz]

--refList <value>, --rl <value>
    a file containing list of reference genome files, one genome per line

-q <value>, --query <value>
    query genome (fasta/fastq)[.gz]

--ql <value>, --queryList <value>
    a file containing list of query genome files, one genome per line

-k <value>, --kmer <value>
    kmer size <= 16 [default : 16]

-t <value>, --threads <value>
    thread count for parallel execution [default : 1]

--fragLen <value>
    fragment length [default : 3,000]

--minFrag <value>
    minimum matched fragments for trusting ANI [default : 50]

--visualize
    output mappings for visualization, can be enabled for single genome to
    single genome comparison only [disabled by default]

--matrix
    also output ANI values as lower triangular matrix (format inspired from
    phylip). If enabled, you should expect an output file with .matrix
    extension [disabled by default]

-o <value>, --output <value> [required]
    output file name
```

Another way to calculate ANI is by using [pyani](https://github.com/widdowquinn/pyani), which is a BLAST-based method. pyani is installed within SCGC's anaconda3 module, and can be run on c1 and c2.

To run pyani:

1. place all fasta files that you'd like to compare into a directory
2. Load SCGC's anaconda3 module

```text
module use /mod/scgc

module load anaconda3
module load blast
```

1. Run pyani:

```text
average_nucleotide_identity.py -o {outfile} -i {contig_directory} -m {choose_method, we use ANIb} --workers {threads}
```

Example PBS script:

```text
#!/bin/bash                                                                                                             

## set name of PBS job                                                                                                  
#PBS -N pyani                                                                             

## set the queue                                                                                                        
#PBS -q scgc-route
#PBS -l walltime=96:00:00                                                                                               
#PBS -l mem=10G

#PBS -l ncpus=30                                                                       
                                                 
#PBS -j oe                                                                                              
#PBS -o /home/julia/out/180724_pyani.out


module unload anaconda
module load anaconda3

indir=/mnt/scgc/simon/simonsproject/contigs/
outdir = /mnt/scgc/simon/simonsproject/ani_out/

mkdir $outdir

average_nucleotide_identity.py -o ${outdir} \
-i ${indir} -m ANIb --workers 30
```

