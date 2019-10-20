#! /bin/bash

### extract best BLAST matches based on e-value, coverage and identity 
sort -k1,1 -k12,12gr -k11,11g -k3,3gr output | sort -u -k1,1 --merge > bestHits
