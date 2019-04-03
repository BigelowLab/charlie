---
description: PBS Pro Job Submission
---

# Submit a job

### Submit a job from CFE with `qsub shellscript.sh`

In order to submit a job to the PBS scheduler from cfe, first we will write a submission script. To write your first submission script, create a new file called _submission.sh_ and follow the steps outlined in the **Submission Script Guidelines** section.

Once you have completed your submission.sh script, and saved it in your home directory on cfe, then simply type the command `qsub submission.sh` on the command line.

If everything has worked correctly PBS will print the jobID tag to your terminal screen. It is important to remember the jobID since without it you will not be able to access the job if you need to modify parameters, or delete it.

For example, when we type `qsub submission.sh` on the command line, PBS prints `787.cfe1`, so our jobID is 787.cfe1.

The script below is an example format of a basic submission script. Note that lines that set PBS parameters begin with `#PBS`.

```text
#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N script_name                                                             

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 10 minutes                        
#PBS -l walltime=00:10:00 

## use one compute node and one cpu (this will default to use 2gb of memory)                                                      
#PBS -l select=1:ncpus=1:mem=4GB    
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /home/vcc/output                                                           
#PBS -o /home/vcc/output                                                          


## jobs to submit                                                               
echo start
/bin/sleep 10
echo finished
```

The script creates a new job named script\_name that has access to 1 cpu for 10 minutes and can use up to 2 GB of memory, which is the default setting for memory on a single compute node. The PBS directive `#PBS -l select=1:ncpus=1` could be changed to `#PBS -l mem=400mb,ncpus=1` if a user for instance wanted to specify more or less memory. The script writes then the job output and errors to a directory called output in the users home directory. Then we see that the script submits a very simple job in which it writes start to the output, then waits and writes finished to the output file.

Managing output and error files will be important for the user. Before submitting this script you should change vcc to your username so that output and error files end up in your home directory. Then create an output directory in your home directory by typing the command `mkdir output` on the command line.

### Example scripts

* [Example Basic Submission Script](https://github.com/BigelowLab/charlie/blob/master/Examples/basic_submission.sh)
* [Submit Multiple Jobs Using Arrays](https://github.com/BigelowLab/charlie/blob/master/Examples/multiple_jobs.sh)
* [Submission Script with Email Notifications](https://github.com/BigelowLab/charlie/blob/master/Examples/email_example.sh)

