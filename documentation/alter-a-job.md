# Alter a job

### Modify job Parameters with `qalter`

Most of the job parameters can be modified while the job is waiting in the queue to be run. Once the jobs is running, however, we will only be able to decrease the amount of wall time for the job.

For example we could increase the wall time of job 793.cfe1 since it is still in the queue: `qalter -l walltime=20:00 793`, so the basic format of a command to alter a job parameter is `qalter <PBS command> <JobID>`. A PBS command is similar to a PBS directive, the only difference is that we will exclude the \#PBS preface that is part of the directive in the command form. In this way we can easily change any of the job parameters that we set in the script with PBS directives, using the `qalter` command followed by a PBS command. For example, in the example submission script we name the job _script\_name_ using the PBS directive `#PBS -N script_name` , so the change the name on job 793.cfe1 to new\_name we would use the command `qalter -N new_name 793`. In this way we can easily change all of the job parameters that we sent in our submissions script as long as our job has not begun to run.

In the event that our job status is R, then we may decrease the wall time of our job. For example, we could decrease the wall time of 792.cfe to 5 minutes from the 10 minutes that it was originally assigned using the command `qalter -l walltime=05:00 792`.

