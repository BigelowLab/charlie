---
description: >-
  SSH passthrough allows you to skip the two-step login process, enabling you to
  transfer files directly from your computer to cfe.
---

# SSH Passthrough

{% hint style="info" %}
This article is adapted from NASA's NAS documentation here: [https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough\_232.html](https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough_232.html) Charlie uses the same system structure as NAS, just substitute CFE \(Charlie Front End\) when they use PFE \(Pleiades Front End\). Also, we do not currently use multiple SFE/CFE hosts \(e.g. cfe1, cfe2\).
{% endhint %}

## Setting up SSH passthrough

#### Step 1: Copy OpenSSH public key to host.

This tutorial assumes that you already have a public/private key pair on your local machine.

{% hint style="info" %}
**TIP:** Ensure that you have an .ssh directory on CFE before issuing the scp command below. Otherwise, the command will copy the file id\_rsa.pub to CFE with the filename ".ssh." To create the directory, log into CFE and issue the command mkdir .ssh.
{% endhint %}

On your local system, run:

```
your_local_system$ ssh username@sfe.bigelow.org
```

On SFE, run:

```text
sfe$ scp .ssh/id_rsa.pub username@cfe:~.ssh
```

If you get an error that id\_rsa.pub doesn't exist, you will need to create a new key using the following command:

```text
sfe$ ssh-keygen
```

Press Enter when prompted for a file location \(leave blank for default\)  
Press Enter when prompted for a passphrase \(leave blank\)  
Press Enter to confirm a blank passphrase

**Add your public key to your .ssh/authorized\_keys file on cfe**

```text
sfe$ ssh username@cfe
```

On CFE, run:

```text
cfe$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
cfe$ chmod 600 ~/.ssh/authorized_keys
```

{% hint style="info" %}
If you get the error message "/u/_username_/.ssh/authorized\_keys: No such file or directory" after issuing the above command, you likely have set noclobber, which prevents you from overwriting files. You can use the command unset noclobber first to avoid this problem.
{% endhint %}

#### Step 2: Create/Modify the .ssh/config File on Your Local System

In the ~/.ssh/config file on your local system, add the following entries for sfe and cfe. If you do not have a ~/.ssh/config file, you can create one by using the following template:

```text
Host sfe
  HostName sfe.bigelow.org

Host cfe
  HostName cfe.bigelow.org
  ProxyJump sfe
```

{% hint style="danger" %}
**WARNING:** Your .ssh/config file should be set with no group~~**/**~~others write permission. Otherwise, you will get this error message when you connect: **Bad owner or permissions on /u/your\_local\_username/.ssh/config.**
{% endhint %}

You should now be able to ssh to CFE from your local machine using the following command without the VPN:

```text
your_local_system$ ssh username@cfe
```

You will be prompted for your sfe password, but should then be passed through to CFE.

#### More information

[https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough\_232.html](https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough_232.html)

[https://www.redhat.com/sysadmin/ssh-proxy-bastion-proxyjump](https://www.redhat.com/sysadmin/ssh-proxy-bastion-proxyjump)

