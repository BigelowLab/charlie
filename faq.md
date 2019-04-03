# FAQ

### Which node is my job running on?

`qstat -as1` will show which node your job is running on.

### Error: too many failed attempts to run

Check that user is on execution nodes \(e.g. c1 and c2\) and that uid/gid are same as server \(cfe\).

