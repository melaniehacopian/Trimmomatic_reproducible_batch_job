#!/bin/bash -l

#SBATCH --job-name=trimmomatic         ## Name of the job.
#SBATCH  -A <account>                        ## Account to charge
#SBATCH -p standard                 ## Partition/queue name
#SBATCH --cpus-per-task=12           ## number of cpus
#SBATCH --mem-per-cpu=3G           ## memory per cpu
#SBATCH --mail-user= <your email>    ## Be notified by email when your job starts, ends or is killed.
#SBATCH --mail-type=ALL
#SBATCH --time=1-00:00:00          ##Specify desired time limit
#SBATCH -o myoutput_%j.out          ## File to which STDOUT will be written, %j inserts jobid
#SBATCH -e myerrors_%j.err          ## File to which STDERR will be written, %j inserts jobid

module load trimmomatic/0.39

java -jar /opt/apps/trimmomatic/0.39/trimmomatic-0.39.jar PE -threads 32 -phred33 <your_r1.fq> <your_r2.fq> trimmed_r1_paired.fq trimmed_r1_unpaired.fq file_trimmed_r2_paired.fq file_trimmed_r2_unpaired.fq ILLUMINACLIP:/opt/apps/trimmomatic/0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

# Follow up with fastqc on both trimmed fastq files to ensure adapters were trimmed and quality looks good.
