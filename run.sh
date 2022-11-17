#!/bin/bash
#SBATCH --job-name=sumgnn=0.1.3
#SBATCH -A d4
#SBATCH -p ihub
#SBATCH -c 20
#SBATCH --mem-per-cpu=3000
#SBATCH --time=4-00:00:00
#SBATCH --output sumgnn_old=0.1.3.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=harsha.vasamsetti@research.iiit.ac.in

echo "activating environemnt"

source /home2/harsha.vasamsetti/.miniconda3/bin/activate sumgnn=0.1.3

module add u18/cuda/10.2                     
module add u18/cudnn/8.3.3-cuda-10.2 

echo "starting"
python train.py -d drugbank -e ddi_hop3 --hop=3 --batch=256 --emb_dim=32 -b=10
echo "Ending"

echo "ENDED"
