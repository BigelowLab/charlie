---
description: >-
  SSH passthrough allows you to skip the two-step login process, enabling you to
  transfer files directly from your computer to cfe.
---

# SSH Passthrough

{% hint style="info" %}
This article is adapted from NASA's NAS documentation here: [https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough\_232.html](https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough_232.html) Charlie uses the same system structure as NAS, just substitute CFE \(Charlie Front End\) when they use PFE \(Pleiades Front End\). Also, we do not currently use multiple SFE/CFE hosts \(e.g. cfe1, cfe 2\).
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

In the ~/.ssh/config file on your local system, add the following entries for sfe and cfe. If you do not have a ~/.ssh/config file, you can create one by using the following template:

```text
### The Bastion Host
Host sfe
  HostName sfe.bigelow.org

### The Remote Host
Host cfe
  HostName cfe.bigelow.org
  ProxyJump sfe
```

{% hint style="danger" %}
**WARNING:** Your .ssh/config file should be set with no group~~**/**~~others write permission. Otherwise, you will get this error message when you connect: **Bad owner or permissions on /u/your\_local\_username/.ssh/config.**
{% endhint %}

Setting up SSH passthrough may be complicated, but it is worth doing to save time in the future.

#### More information

[https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough\_232.html](https://www.nas.nasa.gov/hecc/support/kb/setting-up-ssh-passthrough_232.html)

[https://www.redhat.com/sysadmin/ssh-proxy-bastion-proxyjump](https://www.redhat.com/sysadmin/ssh-proxy-bastion-proxyjump)

