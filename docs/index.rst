## Topology
**charlie:** Bigelow's high performance computing cluster (HPCC), consisting of multiple nodes  
**cfe:** Charlie front end - where jobs are submitted  
**c1:** UV2000 - 160 cores (Intel Xeon E7-4640, 2.1GHz (2.60GHz turbo), 40MB cache, 12 cores, 24 threads), 1.25TB memory  
**c2:** UV300 - 128 cores (Intel Xeon E7-4850, 2.1GHz (2.80GHz turbo), 30MB cache, 16 cores, 32 threads), 2TB memory (* limited to SCGC/Stepanauskas group)  
**c3:** Dell R610 stack  
**cdata:** SGI NetApp storage cluster on c2  

## Requesting an account
To request an account on Charlie, please download and complete the Account Request Form in Storage > Resources > IT > Forms. If you do not have access to storage, please email helpdesk@bigelow.org to request a form. Once your request has been approved and the account created, you will receive an email with your username and a temporary password. You will be prompted to change  this password the first time that you log in.

## Connecting to Charlie

### MacOS and Linux
Open a terminal application (Mac: /Applications/Utilities/Terminal)

Use ssh to securely log into the Charlie front end (cfe):  
`ssh username@cfe.bigelow.org`  
(this can be shortened to `ssh cfe` if your username on cfe is the same as on your computer and if you are using Bigelow's DNS server.)

### Windows
There are two options for connecting to Charlie using a Windows computer:  
**PuTTY** Download and install [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).  
**Web portal** Open your web browser and go to https://cfe.bigelow.org/shell/

## Using Charlie
Code is not run directly on cfe, which has very limited resources. Rather jobs are submitted to Charlie's nodes (e.g. c1, c2, and c3) using the [PBS Pro job scheduler](PBS-on-Charlie). Only basic programs and utilities are installed on the nodes themselves. To use software packages that are not installed locally (or a different version than what is installed locally) you will use [environment modules](modules).

## Troubleshooting
There is an active community of Charlie users on the [Bigelow Slack workspace](https://bigelowlab.slack.com/). Channels include: #comp-charlie and #comp-code. Please post questions there before emailing helpdesk@bigelow.org.
