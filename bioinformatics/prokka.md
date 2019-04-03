# Prokka



Julia Brown edited this page on Oct 15, 2018 · [1 revision](https://github.com/BigelowLab/charlie/wiki/Prokka/_history)

Prokka is available via SCGC's anaconda package.

To run:

```text
module load anaconda
```

Then prokka is in your path.

An example prokka command:

```text
prokka --force --outdir {outdirectory} --prefix {prefix} --locustag {prefix} --cpus {cores_to_use} {input_fasta}
```

