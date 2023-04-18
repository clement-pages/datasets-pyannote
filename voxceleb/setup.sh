#!/bin/bash

VOX1_DEV_FOLDER="./VoxCeleb1/dev/"
VOX1_TEST_FOLDER="./VoxCeleb1/test"
VOX2_DEV_FOLDER="./VoxCeleb2/dev/"
VOX2_TEST_FOLDER="./VoxCeleb2/test"

# Downloading part:

echo "Downloading VoxCeleb1 development dataset..."
mkdir -p $VOX1_DEV_FOLDER
wget -c -P $VOX1_DEV_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox1_dev_txt.zip"

echo "Downloading VoxCeleb1 test dataset..."
mkdir -p $VOX1_TEST_FOLDER
wget -c -P $VOX1_TEST_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox1_test_txt.zip"

echo "Downloading VoxCeleb2 development dataset..."
mkdir -p $VOX2_DEV_FOLDER
wget -c -P $VOX2_DEV_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox2_dev_txt.zip"

echo "Downloading VoxCeleb2 test dataset..."
mkdir $VOX2_TEST_FOLDER
wget -c -P $VOX2_TEST_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox2_test_txt.zip"


# Extraction part:
 
echo "Extracting vox1_dev_txt..."
unzip $VOX1_DEV_FOLDER/vox1_dev_txt.zip -d $VOX1_DEV_FOLDER
rm -rd $VOX1_DEV_FOLDER/vox1_dev_txt.zip

echo "Extracting vox1_test_txt..."
unzip $VOX1_TEST_FOLDER/vox1_test_txt.zip -d $VOX1_TEST_FOLDER
rm -rd $VOX1_TEST_FOLDER/vox1_test_txt.zip

echo "Extracting vox2_dev_txt..."
unzip $VOX2_DEV_FOLDER/vox2_dev_txt.zip -d $VOX2_DEV_FOLDER
rm -rd $VOX2_DEV_FOLDER/vox2_dev_txt.zip

echo "Extracting vox2_test_txt..."
unzip $VOX2_TEST_FOLDER/vox2_test_txt.zip -d $VOX2_TEST_FOLDER
rm -rd $VOX2_TEST_FOLDER/vox2_test_txt.zip

