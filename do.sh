#!/bin/bash
# Note: for the moment this file needs to be executed in the same directory as your sample files. Also, you will want to change the directory path (from /home/jbfink/DeepSeeNet/ to wherever you have this installed and where your samples are. Sorry about that, I'm terrible at scripting.

base_directory="/home/jbfink/DeepSeeNet/"
output_directory="/tmp"
image_directory="/home/jbfink/DeepSeeNet/rumaisa-sample"

export PYTHONPATH=$base_directory:$PYTHONPATH
list=`ls -1 retinal_BL_left_*.jpg | sed -e "s/retinal_BL_left_//;s/\.jpg//"`

date=`date +%Y%m%d%H%M`


echo $list
for j in $list; do
	if [ -f retinal_BL_right_$j.jpg ] ; then
	echo "$j" >> /$output_directory/output_$date.txt
	echo "---------" >> /$output_directory/output_$date.txt
	python3 /$base_directory/examples/predict_simplified_score.py /$image_directory/retinal_BL_left_$j.jpg /$image_directory/retinal_BL_right_$j.jpg 2>&1 | tail -4 >> /$output_directory/output_$date.txt
	echo "---------" >> /$output_directory/output_$date.txt
	echo "" >> /$output_directory/output_$date.txt
	fi
done
