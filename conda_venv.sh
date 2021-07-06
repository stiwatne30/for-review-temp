#!/bin/bash
MY_VENV=dm-eda-test
PYTHON_VERSION=3.8

echo "My virtual environment is called" $MY_VENV

conda create \
    --name $MY_VENV \
    python=$PYTHON_VERSION -y && \
    
echo "Virtual environment" $MY_VENV && \
echo "Created with python version" $PYTHON_VERSION && \

conda activate $MY_VENV && \
echo "Virtual environment activated"
    
pip install \
    -r for-review-temp/requirements.txt && \
echo "Requirements installed"

echo "Installing the kernel to jupyter"
pip install \
    --user ipykernel && \
    
python -m ipykernel install \
    --user \
    --name=$MY_VENV

echo "Please restart the vm"


# to run this file - 
# chmod +x ~/for-review-temp/conda_venv.sh && \
# bash ~/for-review-temp/conda_venv.sh