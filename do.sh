#!/bin/bash
# Note: for the moment this file needs to be executed in the same directory as your sample files. Also, you will want to change the directory path (from /home/jbfink/DeepSeeNet/ to wherever you have this installed and where your samples are. Sorry about that, I'm terrible at scripting.

export PYTHONPATH=/home/jbfink/DeepSeeNet:$PYTHONPATH
list=`ls -1 retinal_BL_left_*.jpg | sed -e "s/retinal_BL_left_//;s/\.jpg//"`

date=`date +%Y%m%d%H%M`

echo $list
for j in $list; do
	if [ -f retinal_BL_right_$j.jpg ] ; then
	echo "$j" >> /tmp/output_$date.txt
	echo "---------" >> /tmp/output_$date.txt
	python3 /home/jbfink/DeepSeeNet/examples/predict_simplified_score.py /home/jbfink/DeepSeeNet/rumaisa-sample/retinal_BL_left_$j.jpg /home/jbfink/DeepSeeNet/rumaisa-sample/retinal_BL_right_$j.jpg 2>&1 | tail -4 >> /tmp/output_$date.txt
	echo "---------" >> /tmp/output_$date.txt
	echo "" >> /tmp/output_$date.txt
	fi
done
