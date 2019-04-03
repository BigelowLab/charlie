# Email notifications

You can add additional PBS directives in your script to allow for an email to be sent to your when the jobs has begun running, finished running or has been aborted \(due to errors or having been killed\). By adding the PBS directive `#PBS -m bea` to your submission script you will receive and email once execution has begun \(b\), when execution has terminated \(e\) and when execution has been aborted \(a\). Then include the email address you would like the message to be sent to with the following directive: `#PBS -M username@bigelow.org`.

