# SSH Passthrough

SSH passthrough allows you to skip the two-step login process, enabling you to transfer files directly from your computer to cfe.

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



