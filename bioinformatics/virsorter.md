# VirSorter

Modules and env to run virsorter:

```text
module unload anaconda
module load anaconda3
module load virsorter
module load mga

source activate virsorter
```

To get instructions:

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

You may have to specify the data-dir to get it to work. You can use this one: /mnt/scgc\_nfs/ref/virsorter/virsorter-data/ which was the latest version of the database as of May, 2018

