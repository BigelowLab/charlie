# Submit a job

Charlie uses a job submission engine called PBS Pro. To submit jobs to a node on Charlie, use the `qsub` command \(`/opt/pbs/bin/qsub`\). Upon successful submission of a job, you will receive a job id, a unique 6 or 7 digit number. Job id's are issued in sequential order and can be used to look up your job using [qstat](job-status.md).

## Submit a job from the command line

To submit a job from the command line, use the qsub command followed by the arguments/options \(below\).

Start an interactive session \(i.e. log into a node through PBS\):

`e.g. qsub -I -N dada01 -l ncpus=12,mem=20GB`

Start a script:

`e.g. qsub -N dada01 -l ncpus=12,mem=20GB -- /bin/sh /mnt/dir/script.sh`

## Submit a job from a script

To submit a job using a shell script, include the arguments/options \(below\) at the beginning of the script, using the \#PBS prefix. Normally in a shell script, anything after a hash \(\#\) is a comment, however \#PBS is a special operator that specifies PBS options. To run your script \(example below\) use `qsub /path/to/script.sh`.

{% code title="example.sh" %}
```bash
#!/opt/pbs/bin/qsub

#PBS -N test   # name
#PBS -q route
#PBS -V        # copy environment variables

#PBS -l ncpus=1,mem=1gb
#PBS -l walltime=00:10:00

# Load modules
module use /mod/bigelow
module load R
# etc...
```
{% endcode %}

## Options

Use the following options when using qsub to customize the job parameters and select resources to request.

| Option | Description | Example |
| :--- | :--- | :--- |
| `-a` | Start time \(`[[[[CC]YY]MM]DD]hhmm[.SS]` where `CC`=century, `YY`=year, `MM`=month, `DD`=day of the month, `hh`=hour, `mm`=minute, `SS`=seconds\) | `qsub -a 201901201000` |
| `-e` | Error directories | `qsub -e /home/<username>/error` |
| `-I` | Interactive | `qsub -I` |
| `-J` | Range of job array \(`start-end[:step]`\) | `qsub -J 2-8:2` |
| `-l` | Request options \(more below\) | `qsub -l ncpus=2,mem=4GB` |
| `-m` | Email job status \(`b`=begin, `e`=end, `a`=abort\) | `qsub -m bea` |
| `-M` | Email address \(can be comma separated list\) | `qsum -M uname@bigelow.org` |
| `-N` | Name of job | `qsub -N Example` |
| `-o` | Output directories | `qsub -o /home/<username>/out` |
| `-q` | Queue \(see [queue list](../topology-and-queues.md)\) | `qsub -q low` |
| `-V` | Pass environment variables with job | `qsub -V` |
| `-X` | Use X-Window for GUI applications \(should be used with interactive jobs; `-I`\) | `qsub -X -I` |

More options can be found by typing `man qsub`

## List of job requirements \(`-l`\)

Specify the system resources that you need using the -l select option.

| Option | Description | Example |
| :--- | :--- | :--- |
| `ncpus` | CPUs | `qsub -l ncpus=2` |
| `mem` | Memory \(RAM\) | `qsub -l mem=4GB` |
| `model` | Model \(e.g. c1, c2, c3\) | `qsub -l model=c1` |
| `walltime` | Walltime \(HH,MM,SS\) | `qsub -l walltime=05:00:00` |
| `select` | Nodes\* \(see below\) | `qsub -l select=1` |

Resource requests can be combined using commas between. You can use any combination as long as it starts with a select.

E.g. Start a job with 2 cpus and 4GB memory \(RAM\) that will run on a node in the c3 cluster in under 5 hours:

```bash
qsub -l ncpus=2,mem=4GB,walltime=05:00:00,model=c3
```

#### \*Nodes

c1 and c2 are shared memory systems, so you do not need to use the select argument. c3 is a cluster of nodes with 24 cpus and 32GB of memory each. To use more than one node on c3, use the select argument. Note that parameters are separated with colons instead of commas.

E.g. to request 3 nodes, each with 24 CPUs and 30GB of memory:

```text
qsub -l select=3:ncpus=24:mem=30
```

## A note on job arrays \(`-J`\)

Job arrays are a way to efficiently organize and submit multiple similar jobs. The PBS scheduler treats each sub-job in the job array as an individual job in the queue specified by the job array. Since job arrays are often large and can take up a significant amount of resources, we recommend submitting them to the low priority queue, so that other individual jobs can still be scheduled in the meantime.

## Examples

```yaml
# Request interactive job
qsub -I -l ncpus=1,mem=1gb

# Request interactive job on c1
qsub -I -l ncpus=1,mem=1gb,model=c1

# Request interactive job with X Window (GUI) support
qsub -I -X -l ncpus=1,mem=1gb

# Run command using high priority queue
qsub -q high -l ncpus=1,mem=1gb -- command

# Run PBS submission script
qsub /path/to/script.sh
```

## Related docs

{% page-ref page="job-status.md" %}

{% page-ref page="delete-a-job.md" %}

