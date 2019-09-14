PDFRender
=========

PDFRender.  
Copyright (c) 2013, Luis Quesada Torres - https://github.com/lquesada | www.luisquesada.com

PDFRender accepts as input a density value, a pdf file and a list of resolutions  
and produces one image-based pdf file per resolution value with no external  
requirements nor rendering artifacts.

PDFReader requires that convert (from ImageMagick) is in the path.

Usage: bash pdfrender.sh \<pdf file\> \<density\> \<list of resolutions\>

Example: bash pdfrender.sh slideshow.pdf 200 1024x768 800x600

