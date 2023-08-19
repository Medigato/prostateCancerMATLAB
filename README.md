# prostateCancerMATLAB
This algorithm extracts the information from the PROMIS Dataset and produces a deep neural network analysis using binary classification.

# Input 
This algorithm requires PROMIS Dataset information to train. 
Two zip files are necessary for the algorithm. One of them contains the necessary CRF, TPM and TRUS reports, 
and the other contains all MRI images. 
Both of these zipfiles can be downloaded from NCITA Promis Dataset. 
# ReadMe File
Structure:
All scripts and functions are in current working directory. 
Folders
↳DICOMImgs:
    Contains uncompressed image files.
↳LabeledImgs
    Created by labelimages. Contains processed images separated into appropiate folders
↳Reports
  Contains CRF, TRUS and TPM Reports. 

Available functions

# unzipImages() 
Gets Zip files and extracts them to DICOMImgs

# biggestBlob = ExtBigBlob(BW)
Selects biggest blob from grayscale image
ExtBigBlobM runs a demo to show segmentation


# thresholdMRI(img,lowerbound,upperbound)
returns binary image within selected threshold bounds

# makeimds()
makes imds from images in LabeledImgs

# labelImages(filteredCollection, selectedTPM)
Uses data from filteredCollection and selectedTPM to
Label images by saving them to cancerImages and nocancerImages
respectively.

Available Scripts
# MainScript.mlx
Requires all other functions
Runs analysis on available images or prompts user to select a zip file.


# dCollection.mlx
Scans images in DICOMImgs and creates variable 'collection'
collection is an important variable as it includes a lot of information
dicomcollection takes a long time
algorithm should load from 'collection.mat' if possible


# imageTraining
Runs convolutional neuralnetwork using labeled images in
imagedatastore('imds')

Next Steps: 
Finish implementing Network Training
Implement Image Processing
Complete Methodology
