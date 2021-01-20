# Jupyter Notebooks

## 0. Connect to Bigelow's VPN

## 1. Start an interactive session

For c1 or c3:

```text
qsub -I -q route -l walltime=8:00:00 -l ncpus=2,mem=16G -N jupyter-interactive
```

Use an additional `-l model=<model>` option if the user wants to specifically use c1 or c3.

For c2:

```text
qsub -I -V -q scgc-route -l walltime=8:00:00 -l ncpus=2,mem=32G -N jupyter-interactive
```

## 2. Navigate to your notebooks directory, set up environment:

Run:

```text
module load anaconda3

unset XDG_RUNTIME_DIR
```

## 3. Determine the IP address of the compute nodes

Run:

```text
cat /etc/hostname
```

The hostname should be displayed. Then, using the table below, find out the IP address of the machine:

| Hostname | IP address |
| :--- | :--- |
| c1 | 10.10.1.1 |
| c2 | 10.2.1.61 |
| c3-0 | 10.2.13.0 |
| c3-1 | 10.2.13.1 |
| c3-2 | 10.2.13.2 |
| c3-3 | 10.2.13.3 |
| c3-4 | 10.2.13.4 |
| c3-5 | 10.2.13.5 |
| c3-6 | 10.2.13.6 |
| c3-7 | 10.2.13.7 |
| c3-8 | 10.2.13.8 |
| c3-9 | 10.2.13.9 |
| c3-10 | 10.2.13.10 |
| c3-11 | 10.2.13.11 |
| c3-12 | 10.2.13.12 |
| c3-13 | 10.2.13.13 |
| c3-14 | 10.2.13.14 |

Alternatively, use the `ifconfig` command to find out the IP address.

## 4. Start a jupyter notebook session

Run:

```text
jupyter notebook --no-browser --port=<port> --ip=<ip address>
```

The port can be in the range of 8888-8898. The ip address is the IP found in the previous step. For example, if you are in c1, to start a session, run:

```text
jupyter notebook --no-browser --port=8888 --ip=10.10.1.1
```

You should get ouput that looks like this:

```text
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://10.10.1.1:8888/?token=3258d683aae77486e9880349b0c61b2412f32ae787a9463b
```

Note the 'port' value in the URL. Above it is '8888', but this could vary if others are also running notebooks on the server you're working on.

## 5. Copy and paste the URL from your notebook session into a browser on your local machine.

In the above example you would copy "[http://10.10.1.1:8888/?token=3258d683aae77486e9880349b0c61b2412f32ae787a9463b](http://10.10.1.1:8888/?token=3258d683aae77486e9880349b0c61b2412f32ae787a9463b)", open your browser of choice, and paste it into the navigation bar.

