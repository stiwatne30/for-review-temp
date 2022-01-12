#!/bin/bash
MY_VENV=multi_labels
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
    -r ~/bi-multi-label_tests/skt/requirements-exp.txt && \
echo "Requirements installed"

echo "Installing the kernel to jupyter"
pip install \
    --user ipykernel && \
    
python -m ipykernel install \
    --user \
    --name=$MY_VENV

echo "Please restart the vm"


# to run this file - 
# chmod +x ~/bi-multi-label_tests/skt/conda_venv.sh && \
# bash ~/bi-multi-label_tests/skt/conda_venv.sh