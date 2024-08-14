#/!/bin/bash

# Test code for fieldmap correction.
# This script lists commands for performing a fieldmap correction for a single subject. The script assumes all necessary brain data
# is within a single subject folder. 

# Need to rework code for flexibility to run on batches of subjects!


# The working directory needs to have the following files:
# - B0 phase image
# - B0 magnitude image
# - T1 image
# - all BOLD images


# Rename files for use with FSL. (e.g. sub001_fmap_phase.nii, sub001_fmap_mag.nii, sub001_anat_T1.nii)


# Compress all .nii files to be .nii.gz.


# Brain extract magnitude image
bet sub-001_fmap_mag.nii.gz sub-001_fmap_mag_brain -B -f 0.25

# Brain extract T1
bet sub-001_anat_T1.nii.gz sub-001_anat_T1_brain -B -f 0.25

# Generate fieldmap
fsl_prepare_fieldmap SIEMENS sub-001_fmap_phase.nii.gz sub-001_fmap_mag_brain.nii.gz sub-001_fmap_rads 2.46

# Use FEAT to apply fieldmap to EPI data
# FEAT parameters:
# - First-level analysis and Pre-processing
# - Data: Set number of inputs to the number of BOLD files that need to be fieldmap corrected (likely 7 BOLD files)
# - Pre-stats: 
#   - might want to include motion correction?
#   - check B0 unwarping
#   - Fieldmap: sub001_fmap_rads
#   - Fieldmap mag: sub001_fmap_mag_brain
#   - EPI Echo Space: 0.62
#   - EPI TE: 25ms
#   - Unwarp direction: -y
#   - Signal loss threshold default is 10%
# - Registration:
#   - Main structural image: sub001_anat_T1_brain