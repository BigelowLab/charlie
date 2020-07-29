# Job status

### Job Status

To see all jobs on Charlie \(running and queued\), use the `qstat -a` command \(`/opt/pbs/bin/qstat`\). It will generate a table with the job id, name, user, and resource requests \(nodes, cpus/tsk, memory, time\).

| Option | Description |
| :--- | :--- |
| `-1` | Add as last argument to keep each job to one line \(used with `-n` and `-s`\) |
| `-a` | Show additional information, including requested resources |
| `-f <job id>` | Shows full information about job |
| `-n` | Show node that job is running on \(if used with `-a`, use `-n` _after_ `-a`\) |
| `-p` | Show percentage complete instead of time used column \(cannot be used with `-a`\) |
| `-q` | Show all queues and the total requested resources for all jobs in each queue \(do not use with other options\) |
| `-s` | Show job start time, node, cpus, and memory for running jobs. Use with `-1` to display output on one line per job |
| `-T` | Show estimated start time instead of elapsed time |
| `-u <username>` | Show jobs for a specific user |
| `-w` | Use wider fields \(up to 8 characters wide instead of 4\) |

The status column uses one letter to represent the status of a job. Use the table below to as a reference.

| Status | Description |
| :--- | :--- |
| `E` | Exiting after having run |
| `F` | Finished |
| `H` | Held |
| `Q` | Queued |
| `R` | Running |
| `S` | Suspended \(contact admin to resume\) |
| `W` | Waiting for submitter-assigned start time to be reached |
| `X` | Completed execution or has been deleted |

### Examples

```bash
# Show job status and requested resources
qstat -a

# In addition to qstat -a output, shows which node a job is running on
qstat -an1

# Show all queues and the total requested resources for all jobs in each queue
qstat -q

# Show all jobs for user hbigelow
qstat -u hbigelow

# Show all information for job with job id 123456
qstat -f 123456
```



