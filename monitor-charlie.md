# Monitor Charlie

There are several ways to monitor the status of Charlie. The following commands are used from cfe1.

### Compute Nodes

The command `ctop` allows users to monitor the current load on the compute nodes of Charlie. From cfe1, the `ctop` command can be used directly as follows:

```text
-bash-4.2$ ctop
REQUESTED RESOURCES BY NODE

 node   cpu   %cpu  mem(gb)  %mem #jobs
----- ------- ---- --------- ---- -----
   c1  16/160  10%  100/1219   8%     2
   c2 104/256  40%  130/1826   7%     3
 c3-0    0/24   0%      0/31   0%     0
...
...
...
c3-14    0/24   0%      0/31   0%     0
```

The command also offers other options. Option `-j` shows additionally the jobs that are running on the compute nodes. Option `-g` offers a graphical way to inspect the load of the nodes, as shown below. The options can also be used in combination.

```text
-bash-4.2$ ctop -g
REQUESTED RESOURCES BY NODE

c1
    CPU: 16/160                      ##########..........................................................................................(10%).
    MEM: 100/1219gb                   ########............................................................................................(8%).
    # of running jobs: 2
...
...
...
c3-14
    CPU: 0/24                         ....................................................................................................(0%).
    MEM: 0/31gb                       ....................................................................................................(0%).
    # of running jobs: 0
```

### Jobs

As mentioned in the [Job status](job-submission/job-status.md) page, the `qstat` command offers a variety of ways to monitor the jobs that are running. For details on the available options and possible job status, please refer to the [Job status](job-submission/job-status.md) page. Here, we describe some common, useful commands.

We created a shortcut command `qwatch`, which calls `qstat -an1` every second, so it creates an real-time view of the status of the jobs in Charlie:

```text
-bash-4.2$ qwatch

Every 1.0s: qstat -an1                                                                                                 Wed Jul 29 08:51:34 2020

cfe1:
                                                            Req'd  Req'd   Elap
Job ID          Username Queue    Jobname    SessID NDS TSK Memory Time  S Time
--------------- -------- -------- ---------- ------ --- --- ------ ----- - -----
387996.cfe1     my_user1 normal     my_job_1  31816   1   8   50gb 20:00 R 16:35 c1/1*8
388017.cfe1     my_user1 normal     my_job_2  48712   1   8   50gb 20:00 R 13:14 c1/18*8
388020.cfe1     my_user2 normal     my_job_4  49772   1   8   50gb 20:00 R 13:02 c1/9*8
```

The `qstat` command itself offers snapshots of different aspects of Charlie depending on the options. Here provide a list of common option combinations used in `qstat [option]`, such as `qstat -an1`.

| Option | Description |
| :--- | :--- |
| `-an1` | Display job information, including the node it is running on |
| `-Jtan1` | Using the same format as `-an1`, display only job arrays, and expand the sub-jobs in the job arrays |
| `-u <username>` | Display the running jobs of a user |
| `-xu <username>` | Display all \(running and finished\) jobs of a user |
| `-xf <job_id>` | Display detailed information about a job \(running or finished\) |

### Queues

The `qstat` command also offers options to monitor the status of the queues of Charlie. For example,

```text
-bash-4.2$ qstat -q

server: cfe1

Queue            Memory CPU Time Walltime Node   Run   Que   Lm  State
---------------- ------ -------- -------- ---- ----- ----- ----  -----
scgc-normal        --      --    336:00:0  --      3     0   --   E R
normal             --      --    576:00:0  --      3   156   --   E R
route              --      --       --     --      0     0   --   E R
...
scgc-high          --      --       --     --      0     0   --   E R
workq              --      --       --     --      0     0   --   D R
                                               ----- -----
                                                   7   156
```

