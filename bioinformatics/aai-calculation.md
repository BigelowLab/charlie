# AAI Calculation

[comparem](https://github.com/dparks1134/CompareM) is a toolbox for comparative genomics. We are using it to calculate AAI \(Average Amino Acid Identity\) between genomes. It is installed into a conda env within SCGC's anaconda3 module, so to access it you need to enter:

```text
module use /mod/scgc
module load anaconda3  
source activate comparem
```

To see what comparem can do, type:

```text
$ comparem -h
```

Output:

```text
                ...::: CompareM v0.0.23 :::...

    Common workflows:
     aai_wf      -> Calculate AAI between all pairs of genomes
                    (runs call_genes => similarity => aai)
     classify_wf -> Identify similar genomes based on AAI values
                    (runs call_genes => similarity => classify)

    Gene prediction:
     call_genes -> Identify genes within genomes

    Gene homology and genome similarity:
     similarity -> Perform reciprocal sequence similarity search between proteins
     aai        -> Calculate AAI between all pairs of genomes
     classify   -> Identify similar genomes based on AAI value

    Usage profiles:
     aa_usage    -> Calculate amino acid usage within each genome
     codon_usage -> Calculate codon usage within each genome
     kmer_usage  -> Calculate kmer usage within each genome
     stop_usage  -> Calculate stop codon usage within each genome

    Lateral gene transfer:
     lgt_di    -> Calculate dinuceotide (3rd,1st) usage of genes to identify putative LGT events
     lgt_codon -> Calculate codon usage of genes to identify putative LGT events

    Visualization and exploration:
     diss      -> Calculate the dissimilarity between usage profiles
     hclust    -> Perform hierarchical clustering

  Use: comparem <command> -h for command specific help.

  Feature requests or bug reports can be sent to Donovan Parks (donovan.parks@gmail.com)
    or posted on GitHub (https://github.com/dparks1134/comparem).
```

For instructions on CompareM's aai calculation workflow type:

```text
$ comparem aai_wf -h
```

Output:

```text
usage: comparem aai_wf [-h] [-e EVALUE] [-p PER_IDENTITY] [-a PER_ALN_LEN]
                       [-x FILE_EXT] [--proteins] [--force_table FORCE_TABLE]
                       [--blastp] [--sensitive] [--keep_headers] [--keep_rbhs]
                       [--tmp_dir TMP_DIR] [-c CPUS] [--silent]
                       input_files output_dir

Calculate AAI between all pairs of genomes

positional arguments:
  input_files           genome files
  output_dir            output directory

optional arguments:
  -h, --help            show this help message and exit
  -e, --evalue EVALUE   e-value cutoff for identifying initial blast hits
                        (default: 0.001)
  -p, --per_identity PER_IDENTITY
                        percent identity for defining homology (default: 30.0)
  -a, --per_aln_len PER_ALN_LEN
                        percent alignment length of query sequence for
                        defining homology (default: 70.0)
  -x, --file_ext FILE_EXT
                        extension of files to process (default: fna)
  --proteins            indicates the input files contain protein sequences
  --force_table FORCE_TABLE
                        force use of specific translation table
  --blastp              use blastp instead of diamond
  --sensitive           use sensitive mode of DIAMOND
  --keep_headers        indicates FASTA headers already have the format
                        <genome_id>~<gene_id>
  --keep_rbhs           create file with reciprocal best hits
  --tmp_dir TMP_DIR     specify alternative directory for temporary files
                        (default: /tmp)
  -c, --cpus CPUS       number of CPUs to use (default: 1)
  --silent              suppress output
```

