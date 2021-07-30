# Software for Virus Searching and QC

## VirSorter2  
Updated 2/25/2021  

To use:  

```text
module use /mod/scgc/
module unload anaconda
module load anaconda3/2019.07
source activate vs2
```

For instructions on how to run:  

```text
virsorter run --help
```

All underlying databases have been installed, and it should run smoothly.  

## Original VirSorter

```text
module use /mod/scgc/
module unload anaconda
module load anaconda3/2019.07
module load virsorter
module load mga

source activate virsorter
```

For instructions:

```text
julia at c1 in /mnt/scgc_nfs/lab/julia/virsorter_tests
$ wrapper_phage_contigs_sorter_iPlant.pl --help
Usage:
      wrapper_phage_contigs_sorter_iPlant.pl -f sequences.fa

    Required Arguments:

      -f|--fna       Fasta file of contigs

    Options:

      -d|--dataset   Code dataset (DEFAULT "VIRSorter")
      --cp           Custom phage sequence
      --db           Either "1" (DEFAULT Refseqdb) or "2" (Viromedb)
      --wdir         Working directory (DEFAULT cwd)
      --ncpu         Number of CPUs (default: 4)
      --virome       Add this flag to enable virome decontamination mode, for datasets
                     mostly viral to force the use of generic metrics instead of
                     calculated from the whole dataset. (default: off)
      --data-dir     Path to "virsorter-data" directory (e.g. /path/to/virsorter-data)
      --diamond      Use diamond (in "--more-sensitive" mode) instead of blastp.
                     Diamond is much faster than blastp and may be useful for adding
                     many custom phages, or for processing extremely large Fasta files.
                     Unless you specify --diamond, VirSorter will use blastp.
      --keep-db      Specifying this flag keeps the new HMM and BLAST databases created
                     after adding custom phages. This is useful if you have custom phages
                     that you want to be included in several different analyses and want
                     to save the database and point VirSorter to it in subsequent runs.
                     By default, this is off, and you should only specify this flag if
                     you're SURE you need it.
      --help         Show help and exit
```

You may have to specify the data-dir to get it to work. Use this one: /mnt/scgc\_nfs/ref/virsorter/virsorter-data/ which was the latest version of the database as of May, 2018

## Vibrant

```
module use /mod/scgc/
module load anaconda3
source activate vibrant

VIBRANT_run.py --help

usage: VIBRANT_run.py [-h] [--version] -i I [-f {prot,nucl}] [-folder FOLDER]
                      [-t T] [-l L] [-o O] [-virome] [-no_plot] [-d D] [-m M]

Usage: VIBRANT_run.py -i <input_file> [options]. VIBRANT identifies bacterial
and archaeal viruses (phages) from assembled metagenomic scaffolds or whole
genomes, including the excision of integrated proviruses. VIBRANT also
performs curation of identified viral scaffolds, estimation of viral genome
completeness and analysis of viral metabolic capabilities.

optional arguments:
  -h, --help      show this help message and exit
  --version       show program's version number and exit
  -i I            input fasta file
  -f {prot,nucl}  format of input [default="nucl"]
  -folder FOLDER  path to deposit output folder and temporary files, will
                  create if doesn't exist [default= working directory]
  -t T            number of parallel VIBRANT runs, each occupies 1 CPU
                  [default=1, max of 1 CPU per scaffold]
  -l L            length in basepairs to limit input sequences [default=1000,
                  can increase but not decrease]
  -o O            number of ORFs per scaffold to limit input sequences
                  [default=4, can increase but not decrease]
  -virome         use this setting if dataset is known to be comprised mainly
                  of viruses. More sensitive to viruses, less sensitive to
                  false identifications [default=off]
  -no_plot        suppress the generation of summary plots [default=off]
  -d D            path to original "databases" directory that contains .HMM
                  files (if moved from default location)
  -m M            path to original "files" directory that contains .tsv and
                  model files (if moved from default location)               
```

## DeepVirFinder

```
module use /mod/scgc/
module load deepvirfinder/1.0
module load anaconda3
source activate dvf

dvf.py --help
Usage: dvf.py [options]

Options:
  -h, --help            show this help message and exit
  -i INPUT_FA, --in=INPUT_FA
                        input fasta file
  -m MODDIR, --mod=MODDIR
                        model directory (default ./models)
  -o OUTPUT_DIR, --out=OUTPUT_DIR
                        output directory
  -l CUTOFF_LEN, --len=CUTOFF_LEN
                        predict only for sequence >= L bp (default 1)
  -c CORE_NUM, --core=CORE_NUM
                        number of parallel cores (default 1)
```

## CheckV

```
module use /mod/scgc/
module load anaconda3
source activate checkv

checkv end_to_end --help
Run full pipeline to estimate completeness, contamination, and identify closed genomes

usage: checkv end_to_end <input> <output> [options]

positional arguments:
  input       Input nucleotide sequences in FASTA format
  output      Output directory

optional arguments:
  -h, --help  show this help message and exit
  -d PATH     Reference database path. By default the CHECKVDB environment variable is used
  -t INT      Number of threads to use for Prodigal and DIAMOND
  --restart   Overwrite existing intermediate files. By default CheckV continues where program left
              off
  --quiet     Suppress logging messages
```

You will need to designate the database location.  On Charlie, it is located at: ```/mnt/scgc/scgc_nfs/ref/checkv/checkv-db-v1.0/```  

An example command would be:   
```checkv end_to_end <in_fasta> <out_directory> -t <number_of_cores> -d /mnt/scgc/scgc_nfs/ref/checkv/checkv-db-v1.0/```

## VContact
```
module use /mod/scgc/
module load anaconda3
source activate vContact2

vcontact2 --help
```

suggested parameters:  
```--db 'ProkaryoticViralRefSeq94-Merged' --pcs-mode MCL --vcs-mode ClusterONE --c1-bin /mnt/scgc/scgc_nfs/opt/common/clusterone/1.0/cluster_one-1.0.jar```
