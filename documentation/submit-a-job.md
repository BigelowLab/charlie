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

{% code-tabs %}
{% code-tabs-item title="example.sh" %}
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
{% endcode-tabs-item %}
{% endcode-tabs %}

## Options

Use the following options when using qsub to customize the job parameters and select resources to request.

| Option | Description | Example |
| :--- | :--- | :--- |
| `-a` | Start time \(`[[[[CC]YY]MM]DD]hhmm[.SS]` where `CC`=century, `YY`=year, `MM`=month, `DD`=day of the month, `hh`=hour, `mm`=minute, `SS`=seconds\) | `qsub -a 201901201000` |
| `-e` | Error directories | `qsub -e /home/<username>/error` |
| `-I` | Interactive | `qsub -I` |
| `-l` | Request options \(more below\) | `qsub -l ncpus=2,mem=4GB` |
| `-m` | Email job status \(`b`=begin, `e`=end, `a`=abort\) | `qsub -m bea` |
| `-M` | Email address \(can be comma separated list\) | `qsum -M uname@bigelow.org` |
| `-N` | Name of job | `qsub -N Example` |
| `-o` | Output directories | `qsub -o /home/<username>/out` |
| `-q` | Queue | `qsub -q low` |
| `-V` | Pass environment variables with job | `qsub -V` |

More options can be found by typing `man qsub`

### List of job requirements \(-l\)

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

## Examples

Submit interactive job:

`qsub -I -q route -l ncpus=1,mem=1gb`

Run command on Charlie:

`qsub -q route -l ncpus=1,mem=1gb -- command`

Run PBS submission script

`qsub /path/to/script.sh`

### Example scripts

* [Example Basic Submission Script](https://github.com/BigelowLab/charlie/blob/master/Examples/basic_submission.sh)
* [Submit Multiple Jobs Using Arrays](https://github.com/BigelowLab/charlie/blob/master/Examples/multiple_jobs.sh)
* [Submission Script with Email Notifications](https://github.com/BigelowLab/charlie/blob/master/Examples/email_example.sh)

