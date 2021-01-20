# Anvi'o

Anvi'o versions 3, 4 and 5 are installed in their own environments within SCGC's anaconda3 package.

To load Anvi'o version 5 type:

```text
module load anaconda3
source activate anvio5
```

To run it interactively, start an interactive session on charlie like so: \(Note that by running "module purge" all other loaded software modules are also unloaded.\)

```text
julia at cfe1 in ~
$ qsub -I -q route -l walltime=8:00:00 -l ncpus=5,mem=32G -N anvio-interactive
qsub: waiting for job 33493.cfe1 to start
qsub: job 33493.cfe1 ready

julia at c1 in ~
$ module purge

julia at c1 in ~
$ module load anaconda3

julia at c1 in ~
$ source activate anvio5
```

From there you should be able to run any of the Anvi'o commands. e.g.:

```text
(anvio5)
julia at c1 in ~
$ anvi-profile --version
Anvi'o version ...............................: 4
Profile DB version ...........................: 23
Contigs DB version ...........................: 10
Pan DB version ...............................: 8
Genome data storage version ..................: 6
Auxiliary data storage version ...............: 2
```

If you run a job submission using Anvi'o, make sure you have:

```text
module purge
module load anaconda3
source activate anvio5
```

After your PBS parameters and before your terminal commands.

Click [here](https://github.com/BigelowLab/charlie/wiki/Running-Anvi'o-interactive-on-a-browser-through-Bigelow-server.) for instructions on how to interact with your Anvi'o session on C1 through a local browser.

