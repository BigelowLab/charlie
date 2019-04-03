# Jupyter Notebooks

#### 1. Start an interactive session on c1 or c2:

For c1:

```text
qsub -I -q route -l walltime=8:00:00 -l ncpus=5,mem=32G -N jupyter-interactive
```

for c2:

```text
qsub -I -V -q scgc-route -l walltime=8:00:00 -l ncpus=2,mem=32G  -N jupyter-interactive
```

#### 2. Navigate to your notebooks directory, set up environment:

Run:

```text
module load anaconda3

unset XDG_RUNTIME_DIR
```

#### 3. Start a jupyter notebook session

Run:

On c2:

```text
jupyter notebook --no-browser --port=8888 --ip=10.2.1.61
```

On c1:

```text
jupyter notebook --no-browser --port=8888 --ip=10.2.1.51
```

#### 5. Copy and paste the URL from your notebook session into a browser on your local machine.

