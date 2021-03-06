# Software Modules

## Software Modules

Software modules allow users to load and unload specific versions of a program \(e.g. gcc, spades, openmpi, etc.\). The module commands \(below\) essentially just prepend a directory to your PATH variable.

### Specify module repository

There are two main groups of modules on Charlie.

1. Bigelow: General purpose modules; maintained by Bigelow IT
2. SCGC: Available to use; maintained by SCGC

`$ module use /mod/bigelow`

### Show available modules

```text
$ module avail

--------------------- /mod/bigelow/ ---------------------
gcc/6.2.0      null           python/3.0     smrt/2.3.0
metaBAT/0.32.4 openmpi/2.1.1  R/2.15.2       turbomole/7.1
```

### Load a module

`$ module load R`

### Show loaded modules

```text
$ module list
Currently Loaded Modulefiles:
  1) /R/2.15.2   2) /gcc/6.2.0
```

### Unload a module

`module unload R`

