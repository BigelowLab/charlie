
#!/bin/bash                                                                                                             

## set name of PBS job                                                                                                  
#PBS -N job_array_example                                                                                         

## set the job array variable                                                                                           
## creates 10 jobs running the same script                                                                              
#PBS -J 1-10                                                                                                            

## send the environment variables with job                                                                              
#PBS -V                                                                                                                 

## set the queue                                                                                                        
#PBS -q route                                                                                                           

## give job 10 minutes                                                                                                  
#PBS -l walltime=00:10:00                                                                                               

## use one compute node and one cpu (this will default to use 2gb of memory)                                            
#PBS -l select=1:ncpus=1                                                                                                

## output files placed in output directory in the user vcc’s home directory                                             
## **** to use this script change vcc to your Bigelow username ****                                                     
#PBS -e /home/vcc/output                                                                                                
#PBS -o /home/vcc/output                                                                                                


## jobs to submit                                                                                                       
## here we can specify different parameters or input files                                                              
## for jobs using the index of the job                                                                                  


if (( $PBS_ARRAY_INDEX % 2 == 0 ))
then
     echo "I'm an even indexed job!"
else
    echo "I'm an odd indexed job!"

fi

echo "My job index is: $PBS_ARRAY_INDEX"

