+++
title = "Introduction to Hyak"
author = ["John Best"]
date = 2020-02-24
draft = false
+++

## Use Hyak when you need additional resources {#use-hyak-when-you-need-additional-resources}

-   More processing power
-   Models or data don't fit in RAM


## Think carefully about how to use Hyak {#think-carefully-about-how-to-use-hyak}

-   Do you really need to use it?
-   How can you use it efficiently?


## Parallelization {#parallelization}

-   Which steps are independent?
-   Which steps are bottlenecks?
-   How to minimize overhead?


## Example: Simulation study {#example-simulation-study}

1.  Specify operating and estimation models
2.  Simulate 100 operating models
3.  Fit 300 estimation models
4.  Calculate metrics
5.  Summarize results


## Example: Simulation study {#example-simulation-study}

1.  Specify operating and estimation models
2.  Simulate 100 operating models
3.  Fit 300 estimation models
4.  Calculate metrics
5.  Summarize results

Which steps are independent?
Which step is the bottleneck?
Are there steps that could be done together?


## Example: Simulation study {#example-simulation-study}

{{< figure src="/ox-hugo/simstudy.png" >}}


## Parallelization strategies {#parallelization-strategies}

-   What step takes most time?
-   Which step is performed most often?
-   Are there natural save points?
-   Which computations can be reused?
-   Are there other limitations?


## Checkpointing {#checkpointing}

-   Save progress
-   Restart from saved position
-   Use the `ckpt` queue


## What is Hyak? {#what-is-hyak}

-   Mox
-   ~~IKT~~


## Logging in {#logging-in}

```bash
ssh jkbest@mox.hyak.uw.edu
```

Keep your phone handy for 2FA!


## How to choose a node type {#how-to-choose-a-node-type}

{{< figure src="/ox-hugo/nodechoice.png" >}}


## Request an interactive node {#request-an-interactive-node}

-   `build` node:

<!--listend-->

```bash
srun -p build --mem=10G --time=1:00:00 --pty /bin/bash
```

-   `stf-int` node:

<!--listend-->

```bash
srun -p stf-int -A stf --cpus-per-task=28 --mem=120G\
    --time=1:00:00 --pty /bin/bash
```


## Relevant SLURM arguments {#relevant-slurm-arguments}

`srun`
: Request in interactive node

`sbatch`
: Submit a batch job

`-p`
: Partition; node type to use

`-A`
: Account; usually `stf`

`--cpus-per-task`
: Threads per program

`--tasks-per-node`
: Processes to run on each node

`--nodes`
: Number of nodes to request

`--mem`
: Amount of RAM to request

`--time`
: Time to reserve

`--pty`
: Program to start


## Connecting a second time {#connecting-a-second-time}

To see which node you are using:

```bash
squeue -u jkbest
```

```
  JOBID PARTITION ... NODELIST(REASON)
1838469     build ... n2232
```

From login node:

```bash
ssh n2232
```

Now monitor usage with e.g. `htop`


## Modules {#modules}

Key commands:

`module --help`
: Reminders

`module avail`
: List available modules

`module apropos srchstr`
: Search modules for `srchstr`

`module load abcdef`
: Attach module `abcdef`

`module unload abcdef`
: Detach module `abcdef`


## Using a `build` node {#using-a-build-node}

1. Request a `build` node.
2. Load the appropriate R module (or have your custom version accessible).
3. Run `R` at the command line to open R.
4. Use `install.packages` to install what you need.

## Using an `stf-int` node {#using-an-stf-int-node}

1. Request an `stf-int` node (see above).
2. Load the R module.
3. Open R and run:

```R
library(TMB)

runExample("simple")
```

## Submit a batch job to `stf` {#submit-a-batch-job-to-stf}

The "driver script" runs your analysis, including loading packages, reading
data, and `source`ing other files with functions etc. The SLURM script specifies
the resources you need and how to run your driver script. Examples of scripts
that I have used:

- [Driver script](/ox-hugo/fitsims.R)
- [SLURM script](/ox-hugo/fitsims.slurm)

Note that these are just example scripts, I haven't made them self-contained so
they won't run for you. That said, the `fitsims.slurm` file should be a good
starting point for your own SLURM scripts. In the directory with the SLURM
script, you can submit the job:

```bash
sbatch fitsims.slurm
```

Tips:

-   Write a single "driver" script
-   Use `Rscript` to run the driver script


## There are three places to store files {#there-are-three-places-to-store-files}


### Home {#home}

-   `\home\xyz`
-   Persistent, but low performance
-   Configuration files


### GScratch {#gscratch}

-   `\gscratch\stf\xyz`
-   Create your own directory.
-   30-day limit
-   Scratch directory for computations


### Lolo {#lolo}

-   Long-term tape storage
-   Must bundle files together


## How to transfer files {#how-to-transfer-files}

`sftp`
: Connect to `mox.hyak.uw.edu`

`sshfs`
: Attach to local file system

`git`
: Code managed in e.g. a GitHub repo


## Advanced usage {#advanced-usage}

-   Add module imports to your `.bashrc` file
-   Add other customizations
-   Set up `sshfs`
-   [Compile your own R with MKL](https://www.posdefecology.net/post/compiling-r/)
-   Write your own module for everyone to use

