#!/bin/bash
# First recursively find all jpg images in a folder
for i in (find . -name "*.jpg");
# Identify height/width parameters
do
height=`identify -ping -format %h $i`
width=`identify -ping -format %w $i`
# In this case required images no greater than 1100px width or height
# Resize them to no more than specified height/width
if (( width > 1100 ));
	then width="1000"
fi
if (( height > 1100 ));
	then height="1000"
	fi
# Compare height/width ratio to determine which one is larger and then
# convert based on that test
		if (( width >= height ));
			then
				convert $i -resize ${width}x${width} -size ${width}x${width} xc:white +swap -gravity center -composite $i
			else
				convert $i -resize ${height}x${height} -size ${height}x${height} xc:white +swap -gravity center -composite $i
		fi
done;
