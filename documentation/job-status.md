# Job status

### View Job Status with `qstat`

We can monitor how our submitted jobs are progressing by typing `qstat` on the command line. This will generate a table similar to the one below. Here the user vcc is running the submission script script\_name four times. In the status \(S\) column, two jobs are marked with E, meaning that the job has finished. The third job, 792.cfe1, is marked with R, indicating that it is running, while the fourth job marked Q is waiting to be run in the normal Queue.

```text
Job id            Name             User              Time Use S Queue
----------------  ---------------- ----------------  -------- - -----
790.cfe1          script_name      vcc               00:00:00 E normal          
791.cfe1          script_name      vcc               00:00:00 E normal          
792.cfe1          script_name      vcc               00:00:00 R normal 
793.cfe1          script_name      vcc               00:00:00 Q normal 
```

The simple `qstat`command above provides useful basic information about the status and time used for each job submitted. More detailed information is provided with the command `qstat -a` :

```text
cfe1: 
                                                            Req'd  Req'd   Elap
Job ID          Username Queue    Jobname            SessID NDS TSK Memory Time  S Time
--------------- -------- -------- ------------       ------ --- --- ------ ----- - -----
790.cfe1        vcc      normal    script_name        6022   1   1    2gb 00:10  E 00:00
791.cfe1        vcc      normal    script_name        6023   1   1    2gb 00:10  E 00:00
792.cfe1        vcc      normal    script_name        6024   1   1    2gb 00:10  R 00:00
793.cfe1        vcc      normal    script_name        6025   1   1    2gb 00:10  Q 00:00
```

