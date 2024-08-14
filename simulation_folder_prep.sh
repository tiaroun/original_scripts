#/!/bin/bash

#Tiara Bounyarith, May 29th 2024
#Run this script in the PreprintSimulations/Subjects/sub-##/OpenNFT folder after the following
#folders have been successfully downloaded and organized:
#
# -config
# -EPI_Template
# -Run_1
# -Run_2
# -Run_3
# -Run_4
# -Run_5
# -Run_6
# -Settings
# -T1
# -tests

#This script will create a "Watch Folder" within each Run_# folder, Run_#_src folders, and Data_Run_# folders

current_directory=$(pwd)

echo "Current directory is $current_directory ."


#Making Watch Folders within Run_#
mkdir -p Run_1/WatchFolder
mkdir -p Run_2/WatchFolder
mkdir -p Run_3/WatchFolder
mkdir -p Run_4/WatchFolder
mkdir -p Run_5/WatchFolder
mkdir -p Run_6/WatchFolder
echo "Done making Watch Folders for $current_directory ."

#Making Run_#_src folders
mkdir Run_1_src
mkdir Run_2_src
mkdir Run_3_src
mkdir Run_4_src
mkdir Run_5_src
mkdir Run_6_src
echo "Done making Run_#_src folders for $current_directory ."

#Making Data_Run_# folders
mkdir Data_Run_1
mkdir Data_Run_2
mkdir Data_Run_3
mkdir Data_Run_4
mkdir Data_Run_5
mkdir Data_Run_6
echo "Done making Data_Run_# folders for $current_directory ."