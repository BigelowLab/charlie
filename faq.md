# FAQ

### Which node is my job running on?

`qstat -as1` will show which node your job is running on.

### I can't submit a job from sfe.bigelow.org

The secure front end is not a submission node. You need to log into cfe from sfe in order to submit jobs. SFE's only purpose is a secure gateway to Charlie.

### Error: too many failed attempts to run

Check that user is on execution nodes \(e.g. c1 and c2\) and that uid/gid are same as server \(cfe\).

