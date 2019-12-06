If software is available through conda, you can install it yourself into your own anaconda environment.

Information on how to create and manage conda environments can be found at this link:  
https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html

You will first need to load an anaconda3 software module.

```module load anaconda3```

From there, you will want to create your own local environment.  To do so, type:

```conda create --prefix ~/my_env```

Where '~/my_env' is a location in storage or in your home directory where you have permission to read and write files.

Once you've created this environment you can enter it by typing:
```source activate ~/my_env```

And then once you are inside your environment you can start to install software using conda.

So, if you wanted to install, say, bamm into your environment, here are the commands you would use:

```
#load the anaconda3 module
module load anaconda3

conda create --prefix ~/my_env
source activate ~/my_env

# information on conda package found here: https://anaconda.org/bioconda/bamm
conda install -c bioconda bamm
```

And then whenever you wanted to run bamm, you would just have to make sure that you've loaded your conda environment.
