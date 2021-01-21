# SSH Passthrough

SSH passthrough allows you to skip the two-step login process, enabling you to transfer files directly from your computer to cfe.

{% hint style="info" %}
This article is adapted from NASA's NAS documentation here: [https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough\_232.html](https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough_232.html) Charlie uses the same system structure as NAS, just substitute CFE \(Charlie Front End\) when they use PFE \(Pleiades Front End\). Also, we do not currently use multiple SFE/CFE hosts \(e.g. cfe1, cfe 2\).
{% endhint %}

## Setting up SSH passthrough

#### Step 1: Copy OpenSSH public key to host.

This tutorial assumes that you already have a public/private key pair on your local machine.

{% hint style="info" %}
TIP: Ensure that you have an .ssh directory on CFE before issuing the scp command below. Otherwise, the command will copy the file id\_rsa.pub to CFE with the filename ".ssh." To create the directory, log into CFE and issue the command mkdir .ssh.
{% endhint %}

On your local system, run:

```
your_local_system$ ssh username@sfe.bigelow.org
```

On SFE, run:

```text
sfe$ scp .ssh/id_rsa.pub username@cfe:.ssh
```

**Add Your OpenSSH Public Key to Your .ssh/authorized\_keys File on the Enclave Host**

```text
sfe$ ssh username@cfe
```

On CFE, run:

```text
cfe$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

{% hint style="info" %}
If you get the error message "/u/_username_/.ssh/authorized\_keys: No such file or directory" after issuing the above command, you likely have set noclobber, which prevents you from overwriting files. You can use the command unset noclobber first to avoid this problem.
{% endhint %}

{% hint style="warning" %}
**WARNING**: The permission for the authorized\_keys file must be set to 600. To set this permission, run the command **chmod 600 authorized\_keys**. Group/others write permissions on /u/_username_ and /u/_username_/.ssh are not allowed for public key authentication.
{% endhint %}

#### Step 2: Create/Modify the .ssh/config File on Your Local System

In the ~/.ssh/config file on your local system, add the entry for CFE. If you do not have a ~/.ssh/config file, you can create one by using the following template:

Move the file to the .ssh directory on your local system and rename it to "config".

```text
Host sfe
        # public key authorization is set up on the SFE you want to switch to
        HostName		sfe.bigelow.org

Host sfe sfe.bigelow.org
	Ciphers			aes128-ctr,aes192-ctr,aes256-ctr
	ForwardAgent		no
        KexAlgorithms 		diffie-hellman-group1-sha1
	MACs			hmac-sha1
        ServerAliveInterval     5m

Host cfe cfe.bigelow.org
	HostKeyAlias		cfe.bigelow.org

# Add additional hosts to the list below as needed
Host *.bigelow.org cfe
        ForwardAgent            yes       
	HostbasedAuthentication	no
	Protocol		2
	ProxyCommand		ssh -oCompression=no sfe /usr/local/bin/ssh-proxy %h
	ServerAliveInterval	5m
	# Replace <Charlie_username> with your Charlie username
	User			<Charlie_username>

```

{% hint style="danger" %}
**WARNING:** Your .ssh/config file should be set with no group~~**/**~~others write permission. Otherwise, you will get this error message when you connect: **Bad owner or permissions on /u/your\_local\_username/.ssh/config.**
{% endhint %}

#### Step 3: Set Up SSH Agent

The ssh-agent program holds and manages the private key on your local system and responds to key challenges from remote hosts. The private key is not initially stored in the agent and is added through the ssh-add program.

Typically, ssh-agent is started at the beginning of an X session or a login session, and you provide your passphrase to unlock your private key for this originating session. For any SSH connection to a remote host \(e.g. sfe\) made from this original session, the ssh-agent remembers your private key and will respond to challenges automatically without prompting you to type in your passphrase again.

How SSH passthrough works: If you want to use SSH to connect from the first remote host \(e.g. SFE\) to a second remote host \(e.g. cfe\) and possibly from the second remote host to a third remote host, a feature called agent forwarding allows a chain of SSHconnections to forward all the key challenges back to the original agent, thus eliminating the need for using a password or public/private keys for these connections.

Note: In order for agent forwarding to work, your public key must be installed in all the remote hosts that you intend to connect to. \(See Step 1.\)

Run one of the following command lines to launch ssh-agent:

* **For csh or tcsh:**

  ```text
  your_local_system% eval `ssh-agent -c` 
  ```

* **For sh or bash:**

  ```text
  your_local_system% eval `ssh-agent -s`
  ```

  If the bash command line shown above results in error, try running this one instead:

  ```text
  your_local_system% eval "$(ssh-agent -s)"
  ```

To add your private key to ssh-agent, run:

```text
your_local_system% ssh-add private_key
```

Example:

```text
your_local_system% ssh-add ~/.ssh/id_rsa
Enter passphrase for /Users/username/.ssh/id_rsa: type your passphrase
```

Setting up SSH passthrough may be complicated, but it is worth doing to save time in the future.

