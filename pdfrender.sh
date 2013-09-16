#!/bin/bash

if [ $# -le 2 ];then
  echo ""
  echo "PDFRender"
  echo "Copyright (c) 2013, Luis Quesada - https://github.com/lquesada"
  echo ""
  echo "PDFRender accepts as input a density value, a pdf file and a list of resolutions"
  echo "and produces one image-based pdf file per resolution value with no external"
  echo "requirements nor rendering artifacts."
  echo ""
  echo "PDFReader requires that convert (from ImageMagick) is in the path."
  echo ""
  echo "Usage: bash pdfrender.sh <pdf file> <density> <list of resolutions>"
  echo ""
  echo "Example: bash pdfrender.sh slidershow.pdf 200 1024x768 800x600"
  echo ""
  exit
fi

file=$1
density=$2

shift
shift

echo "Processing file $file"
echo "Density is $density"
echo "Output resolutions are $@"
echo ""
echo "This might take a while..."

temp=`mktemp -d`
q=0

echo "Rendering pdf to png files..."
convert -density $density $file $temp/$file-expanded.png || q=1
if [ $q -eq 1 ];then
  rm -rf $temp;
  exit 1
fi

echo "Rendered"
echo ""

for i in $@;do
  echo "Generating `echo $file | sed s/'.pdf'//Ig`-$i.pdf file"
  convert `ls $temp/$file-expanded*.png | sort -V` -scale $1! `echo $file | sed s/'.pdf'//g`-$i.pdf 
  echo "Generated"
  echo ""
done


rm -rf $temp
