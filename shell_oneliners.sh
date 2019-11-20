#!

### extract best BLAST matches based on e-value, coverage and identity 
sort -k1,1 -k12,12gr -k11,11g -k3,3gr output | sort -u -k1,1 --merge > bestHits

### extract metadata and variants having passed filtration from a VCF file
awk -F '\t' '{if($0 ~ /\#/) print; else if($7 == "PASS") print}' input > output
