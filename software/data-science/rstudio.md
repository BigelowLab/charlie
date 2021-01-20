# RStudio

## 1. Set up X11 forwarding on the local machine:

To use the RStudio GUI, Charlie allows X11 forwarding. For X forwarding to function, your local machine has to be running an X server program. To set up a X server on the local machine,  please refer to this page for a brief guide: [https://kb.iu.edu/d/bdnt](https://kb.iu.edu/d/bdnt).

## 2. Connect to cfe with X11 forwarding option:

With Bigelow VPN,

run:

```text
ssh -Y <username>@cfe
```

With no Bigelow VPN,

Use ssh port forwarding. For example, in the first terminal, to establish a connection to cfe, run:

```text
ssh -L 2200:cfe:22 <username>@sfe.bigelow.org
```

Then, in the second terminal, connect to cfe by running:

```text
ssh -Y -p 2200 <username>@localhost
```

## 3. Start an interactive session with X11 forwarding

```text
qsub -I -X -q route -l walltime=8:00:00 -l ncpus=2,mem=32G -N rstudio
```

## 4. Load RStudio module

```text
module load rstudio
```

## 5. Start RStudio

```text
rstudio
```

