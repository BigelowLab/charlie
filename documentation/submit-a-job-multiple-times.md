# Submit a job multiple times

Often it is necessary to run the same job multiple times using either different input files or parameters. If each job under the different input files or parameters will require the same maximum wall time and number of compute resources, then an efficient way to submit your jobs is to use a job array. It is easy to convert your basic jobs submission script to a job array script, simply add the PBS directive `#PBS -J <number of jobs>`. If you want to run the job script for 10 jobs, then substitute 1-10 for number of jobs, and PBS will create jobs with index values 1,2,3,...,10; alternatively to produce 10 jobs you could substitute 0-9, and PBS would create index values for the jobs 0,1,2,...,9.

Jobs arrays group the set of jobs submitted under the same jobID. For example, if I submit a job array script, PBS returns a jobID in the format `925[].cfe1`. So, if I want to access a particular job in the array, I just include its index value between the brackets. In this way, to access the jobs with index value 2, I would use the jobID `925[2].cfe1`. The output for the jobs with index 2 in the array is written to a file called `925[2].cfe1.OU`. To manage your output files it is recommendable to create an output directory in your home directory. To do this you can use the command `mkdir output` on the command line.

Under the **Submission Script Guidelines** section the script linked to _Submit Multiple Jobs Using Arrays_ gives an example of a job script that uses a job array. This script performs a very simple task, it determines if the jobs index is even or odd and the prints a message to the output file of the particular job. We can access the job index inside our script using the variable `$PBS_ARRAY_INDEX`, in this way you can see that it will be easy to assign different parameters or input files to the jobs in the array based on the job index value.

### 

