# Anvi'o

Anvi'o versions 3, 4 and 5 are installed in their own environments within SCGC's anaconda3 package.

To load Anvi'o version 5 type:

```
module load anaconda3
source activate anvio5
```

To run it interactively, start an interactive session on charlie like so: (Note that by running "module purge" all other loaded software modules are also unloaded.)

```
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

```
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

```
module purge
module load anaconda3
source activate anvio5
```

After your PBS parameters and before your terminal commands.

**Interact with Anvio through your local browser:**

Will need to open two terminals for this. The reference on the Anvi'o page is here, which we will follow with some tweaks: [http://merenlab.org/2015/11/28/visualizing-from-a-server/](http://merenlab.org/2015/11/28/visualizing-from-a-server/)

1. In the first terminal, ssh into your account as normal, then start an interactive session:\
   \
   `qsub -I -q route -l walltime=0:80:00 -l ncpus=4,mem=4G -N <username>-interactive`
2. Load anvio\
   \
   `module use /mnt/scgc_nfs/opt/modulefiles/common`\
   `module load anaconda3`\
   `source activate anvio3`\
   ``\
   ``Could also load anvi'o 4, see github page on running anvio
3. navigate to the folder where your Anvi'o files are and run the interactive:\
   \
   `anvi-interactive -p SAMPLES-MERGED/PROFILE.db -c AM_ALLmeta_Norm_sccare.db --server-only -P 8099`\
   ``\
   ``Choose a different port number if that one is taken or not working. You should see a screen that says the server is now listening to the port.
4. In second terminal: \
   \
   `ssh -t -t username@cfe.bigelow.org -L 8099:localhost:8099 ssh c# -L 8099:localhost:8099` \
   \
   Replace username with your own user ID, c# with the charlie node that you are logged into (use chost to view node name) and whatever port you chose. You may see an error "bind: Cannot assign requested address" Ignore it. Do not close this terminal window.
5. Go to any browser, and put in the address bar:\
   \
   `http://localhost:8099`\
   ``\
   `(`of course changing the ports to match above.)
