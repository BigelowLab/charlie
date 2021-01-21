---
description: Transfer files to Charlie without using the VPN.
---

# Transfer files to Charlie

To transfer files to Charlie without using the VPN, you should first set up [SSH Passthrough](ssh-passthrough.md).

With SSH passthrough enabled, you can transfer files directly from your computer to Charlie using the secure copy utility \(**scp**\).

```text
your_local_system$ scp /path/to/file username@cfe.bigelow.org:
```

The destination cfe.bigelow.org: will you to your home directory on Charlie. You can specify a different destination after the colon. E.g. to transfer a file to **/mnt/storage/labs/srs/**, you would use the following command:

```text
your_local_system$ scp /path/to/file username@cfe.bigelow.org:/mnt/storage/labs/srs/
```





