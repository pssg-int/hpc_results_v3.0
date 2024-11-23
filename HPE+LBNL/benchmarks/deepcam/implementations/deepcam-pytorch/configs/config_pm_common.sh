#!/bin/bash

# data directory
export DATADIR=/pscratch/sd/c/cunyang/deepcam/data/All-Hist/numpy

# this should never be exceeded by any benchmark
# export MAX_EPOCHS=2 # set in config/congig_pm_*.sh

# this is for some global parameters:
export ADDITIONAL_ARGS="--disable_tuning"

# auxiliary parameters
export LOGGING_FREQUENCY=0

# run parameters
export NEXP=1

# system parameters
export DGXNGPU=4
export DGXSYSTEM=$(basename $(readlink -f ${BASH_SOURCE[0]}) | sed 's/^config_//' | sed 's/\.sh$//' )
