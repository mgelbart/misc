#!/bin/bash

# Runs pdfcrop on all .pdf files in a directory, specified by a cmd line arg.
for f in $1/*.pdf
do
	pdfcrop "$f"
done
