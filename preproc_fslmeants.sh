#!/bin/bash

#Script for taking the mean time series of both the daIC and PMC within preprocessed BOLD fMRI data 
#Written by Tiara Bounyarith on August 15th 2024

current_directory=$(pwd)

for sub in "$current_directory"/*; do
    sub_name=$(basename "$sub")

    for run in "$sub"/*; do
        run_name=$(basename "$run")
        if [ -f "$run/ROI_daIC.nii" ]; then
            output_daIC="$run/${sub_name}_${run_name}_daIC_preproc_meants.txt"
            mask_daIC="$run/ROI_daIC"

            fslmeants -i "$run/filtered_func_data" -o "$output_daIC" -m "$mask_daIC"
        elif [ -f "$run/ROI_PMC.nii" ]; then
            output_PMC="$run/${sub_name}_${run_name}_PMC_preproc_meants.txt"
            mask_PMC="$run/ROI_PMC"

            fslmeants -i "$run/filtered_func_data" -o "$output_PMC" -m "$mask_PMC"
        fi
    done

done
