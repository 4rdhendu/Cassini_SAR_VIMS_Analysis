#!/bin/bash

# This script changees the given cuf file to BandSequential mode

radar_input=$1
crop from = $1 to= bsq_$1+BandSequential

