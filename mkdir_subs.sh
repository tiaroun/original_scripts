#!/bin/bash

#Tiara Bounyarith, August 14th 2024

#very simple script for creating subject folders. must have a text file "sublist.txt" & within the specified sublist_directory
#script reads each line of sublist.txt and makes a folder within the current directory for that subject 

sublist_directory="/Users/tuk54040/Documents/make_sub_folder"
current_directory=$(pwd)

cd "$sublist_directory"

while IFS= read -r line; do
    sub="$line"
    mkdir -p "$current_directory/$sub"
done < sub_list.txt

cd "$current_directory"