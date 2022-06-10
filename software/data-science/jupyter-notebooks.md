# Jupyter Notebooks

## 0. Connect to Bigelow's VPN

## 1. Start an interactive session

For c1 or c3:

```
qsub -I -q route -l walltime=8:00:00 -l ncpus=2,mem=16G -N jupyter-interactive
```

Use an additional `-l model=<model>` option if the user wants to specifically use c1 or c3.

For c2:

```
qsub -I -V -q scgc-route -l walltime=8:00:00 -l ncpus=2,mem=32G -N jupyter-interactive
```

## 2. Navigate to your notebooks directory, set up environment:

Run:

```
module load anaconda3

unset XDG_RUNTIME_DIR
```

## 3. Determine the IP address of the compute nodes

Run:

```
chost
```

The hostname and ip address be displayed.

## 4. Start a jupyter notebook session

Run:

```
jupyter notebook --no-browser --port=<port> --ip=<ip address>
```

The port can be in the range of 8888-8898. The ip address is the IP found in the previous step. For example, if you are in c1, to start a session, run:

```
jupyter notebook --no-browser --port=8888 --ip=10.10.1.1
```

You should get ouput that looks like this:

```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://10.10.1.1:8888/?token=3258d683aae77486e9880349b0c61b2412f32ae787a9463b
```

Note the 'port' value in the URL. Above it is '8888', but this could vary if others are also running notebooks on the server you're working on.

## 5. Copy and paste the URL from your notebook session into a browser on your local machine.

In the above example you would copy "[http://10.10.1.1:8888/?token=3258d683aae77486e9880349b0c61b2412f32ae787a9463b](http://10.10.1.1:8888/?token=3258d683aae77486e9880349b0c61b2412f32ae787a9463b)", open your browser of choice, and paste it into the navigation bar.
