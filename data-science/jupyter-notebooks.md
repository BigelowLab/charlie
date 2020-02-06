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
jupyter notebook --no-browser 
```

You should get ouput that looks like this:

```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://0.0.0.0:8888/?token=80fe1f77afaa12858979b67b6b43b4b6fdddfbcfd80d4acb
```

Note the 'port' value in the URL.  Above it is '8888', but this could vary if others are also running notebooks on the server you're working on.

#### 4. SSH tunnel the notebook to your local machine

**If you are running a notebook on c2, you can skip this step.**

If you are running a notebook from c1, on your local machine, open up a terminal (mac) or putty window (PC) and enter:

```
ssh -t -t julia@cfe -L 8888:localhost:8888 ssh julia@c1 -L 8888:localhost:8888
```

Where you substitute the '8888' for whatever port value is used in the URL obtained in step 3, and you substitute 'julia' for your cfe username.

This will log you into c1 directly.  Do not do anything in this terminal, just let it be while you are working with your notebook.  Close it when you are finished with your notebook session.

#### 5. Copy and paste the URL from your notebook session into a browser on your local machine.

