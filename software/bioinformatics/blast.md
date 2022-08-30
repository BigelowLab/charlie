# BLAST

Scenario: You have a fasta file, called my\_seqs.fasta, with multiple nucleotide sequences in it that you would like to compare to NCBI's nr using Charlie.

What do you do?

#### Getting on Charlie:

1. On your local machine, move your fasta file into a directory system that you have access to on Charlie.
2. Open up a terminal, sign into the charlie front end `ssh username@cfe.bigelow.org`
3. Navigate into the directory that contains your fasta file `cd /mounted/fs/blasts/`\
   3a. Check to see that your fasta file is in the directory you've navigated to: `ls my_seqs.fasta`

#### Setting up your BLAST

1. Set up your BLAST submission:

Putting together a job submission requires you provide the parameters required to submit a job, and the actual commands you will run. Job submission instructions begin with #PBS, shell commands go after the PBS parameters. So for our BLAST example, save the following, with adjusted commands and parameters for your specific BLAST, as a text file on Charlie (for example, save it as: `blast_script.sh` to your home directory):

```
#!/bin/bash

#PBS -N script-name
#PBS -V

#PBS -q route
#PBS -l walltime=00:05:00
#PBS -lselect=1:ncpus=1

#PBS -e /home/kguay/errors/
#PBS -o /home/kguay/out/
  
module use /mod/bigelow
module load blast
blastx -query my_seqs.fasta -db nr -outfmt 6 -num_descriptions 10 -num_alignments 10 -evalue 0.001 -num_threads 8 -o outputblastfile.txt
```

#### Submit the job

Once you've put together this submission text, submit the job by typing:\
`qsub ~/blast_script.sh`

You can see the status of your submitted job (and all jobs in the queue) by typing: `qstat -a`

Once your job is finished, it will disappear from the queue.

### What does it all mean?

#### PBS commands breakdown

Script name will show up in the PBS queue:\
`#PBS -N script-name`

Use submission environment:\
`#PBS -V`

Choose which queue to submit to:\
_link here to PBS queues options_\
`#PBS -q route`

Set max time for run:\
`#PBS -l walltime=00:20:00`

TODO: My understanding of this particular command is fuzzy. For BLAST, there's a --num\_threads command. If I input `num_threads=20` then should my `ncpus=20`? Leave select=1 regardless of how many cpus you are using. Set the number of nodes and cpus per node:\
`#PBS -l select=1:ncpus=1`

Sends error outputs to specific directory\
`#PBS -e /home/kguay/errors/`

Sends standard outputs to specific directory\
`#PBS -o /home/kguay/out/`

#### BLAST command breakdown

1. Load the required module system\
   For SCGC's packages, you would use the command:\
   `module use /mod/scgc`
2. Load the required programs, in this case, we just need SCGC's default BLAST:\
   `module load blast`
3. Run BLAST, _An example command:_

```
blastx -query [input fasta name] -db nr -outfmt 6 -num_descriptions 10 -num_alignments 10 -evalue 0.001 -num_threads 8 -out outputblastfile.txt
```

[BLAST output options](https://www.ncbi.nlm.nih.gov/books/NBK279675/)
