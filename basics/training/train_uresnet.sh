#!/bin/bash 

#SBATCH --account=neutrino:ml-dev
#SBATCH --partition=ampere

#SBATCH --job-name=train_uresnet
#SBATCH --output=batch_outputs/output-train_uresnet.txt 
#SBATCH --error=batch_outputs/output-train_uresnet.txt

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=4g
#SBATCH --time=6:00:00 
#SBATCH --gpus a100:1

singularity exec --bind /sdf/group/neutrino/drielsma/,/sdf/data/neutrino/ --nv /sdf/group/neutrino/images/develop.sif bash -c "python3 /sdf/data/neutrino/software/spine/bin/run.py -c /sdf/group/neutrino/drielsma/train/example/uresnet.cfg"