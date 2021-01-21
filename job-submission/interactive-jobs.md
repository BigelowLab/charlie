# Interactive jobs

Interactive jobs allow the user to log on to c1 via a scheduled session for the purpose of debugging or new feature development. An interactive job can be created by typing `qsub -I submission.sh` on the command line. This submission.sh script will be different than the ones used above in that it will only contain PBS directives, leaving out any code that refers to jobs that you would like to test. A PBS directive starts with a \# symbol followed by commands that tell PBS how much time and resources to allow you to use on Charlie. An example submission script for an interactive session is shown below:

```text
#!/bin/sh
#PBS -l walltime=1:00:00 
#PBS -l select=1:ncpus=1
#PBS -q devel
```

The above script requests a session on c1 lasting 1 hour and using 1 cpu. For most jobs a single cpu will be sufficient, unless working with parallel programs. In this way, after 1 hour, our session will close automatically. The final line in our submission script `#PBS -q devel` tells PBS which queue we would like to use. When using an interactive session the devel queue is the best queue to use because this queue makes sure that the job will be run right away so we can get our test results as fast as possible.

Additionally we do not need to use a submission script for starting an interactive session. We may type the information necessary to start a session directly into the command line as follows: `qsub -I -l walltime=1:00:00 -l select=1:ncpus=1 -q level`. This command will produce the same results as described above.

Once an interactive job has been submitted, PBS will print:

```text
qsub: waiting for job <Job ID> to start
qsub: job <Job ID> ready
```

Once PBS prints that the job is ready, its status is R, and thus it will not be possible to adjust the amount of time of the session. To end an interactive session, simply type `exit` on the command line.

