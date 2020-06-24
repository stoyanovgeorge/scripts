#!/bin/bash


# Script for converting epub or fb2 files to Kindle's mobi

# Prerequisites: Calibre
# You can install it with yum install calibre
# pacman -S calibre or apt install calibre

# Defining of the input directory
in_dir="$HOME/Downloads/"
# Output directory is the directory where the books would be saved
out_dir="$HOME/Documents/books/"
# out_extension is the target extension
out_extension=".mobi"

cd "$in_dir" || exit
shopt -s nullglob
# looping through all files with .epub or .fb2 extension in the $in_dir
for book in *.epub *.fb2
do
    filename="${book%.*}"
    out_file="$out_dir$filename$out_extension"
    in_file="$in_dir$book"
    # ebook-convert is a command line utility for converting e-books into different format, it requires installed Calibre
    ebook-convert "$in_file" "$out_file" 1>/dev/null || exit
    echo "$book has been successfully converted and saved in $out_dir"
    echo "====================================================="
done
