#!/bin/bash

VOX1_DEV_FOLDER="./VoxCeleb1/dev"
VOX1_TEST_FOLDER="./VoxCeleb1/test"
VOX2_DEV_FOLDER="./VoxCeleb2/dev"
VOX2_TEST_FOLDER="./VoxCeleb2/test"

# Check if a key was provided as argument for this setup script:
if [ $# -lt 1 ]
then
	echo "Provide a token in order to download wav files for VoxCeleb1 and VoxCeleb2. This token can be retrieved by filling form at this link : https://cn01.mmai.io/keyreq/voxceleb " >&2
	exit 1
fi

KEY=$1

# Downloading part:

# VoxCeleb1:

# Development part:
echo "Downloading VoxCeleb1 development dataset..."
mkdir -p $VOX1_DEV_FOLDER
wget -c -P $VOX1_DEV_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox1_dev_txt.zip"

if [ -f ${VOX1_DEV_FOLDER}/vox1_dev_wav.zip ]
then
	echo "VoxCeleb 1 wav files were already retrieved"
else
	for part_id in {a..d}
	do
		wget -c -O $VOX1_DEV_FOLDER/vox1_dev_wav_parta$part_id --no-check-certificate "https://cn01.mmai.io/download/voxceleb?key=${KEY}&file=vox1_dev_wav_parta${part_id}"
	done
	echo "Merging archive parts into ${VOX1_DEV_FOLDER}/vox1_dev_wav.zip..."
	cat ${VOX1_DEV_FOLDER}/vox1_dev_wav_parta* > ${VOX1_DEV_FOLDER}/vox1_dev_wav.zip
	rm ${VOX1_DEV_FOLDER}/vox1_dev_wav_parta*

fi

# Test part:
echo "Downloading VoxCeleb1 test dataset..."
mkdir -p $VOX1_TEST_FOLDER
wget -c -P $VOX1_TEST_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox1_test_txt.zip"
wget -c -O $VOX1_TEST_FOLDER/vox1_test_wav.zip --no-check-certificate "https://cn01.mmai.io/download/voxceleb?key=${KEY}&file=vox1_test_wav.zip"

# VoxCeleb2:

# Development part:
echo "Downloading VoxCeleb2 development dataset..."
mkdir -p $VOX2_DEV_FOLDER
wget -c -P $VOX2_DEV_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox2_dev_txt.zip"

if [ -f ${VOX2_DEV_FOLDER}/vox2_dev_aac.zip ]
then
	echo "VoxCeleb 2 aac files were already retrieved"
else
	for part_id in {a..h}
	do
		wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_parta$part_id --no-check-certificate "https://cn01.mmai.io/download/voxceleb?key=${KEY}&file=vox2_dev_aac_parta${part_id}"
	done
	echo "Merging archive parts into ${VOX2_DEV_FOLDER}/vox2_dev_aac.zip..."
	cat ${VOX2_DEV_FOLDER}/vox2_dev_aac_parta* > ${VOX2_DEV_FOLDER}/vox2_dev_aac.zip
	rm ${VOX2_DEV_FOLDER}/vox2_dev_aac_parta*
fi

# Test part:
echo "Downloading VoxCeleb2 test dataset..."
mkdir -p $VOX2_TEST_FOLDER
wget -c -P $VOX2_TEST_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox2_test_txt.zip"
wget -c -O $VOX2_TEST_FOLDER/vox2_test_aac.zip --no-check-certificate "https://cn01.mmai.io/download/voxceleb?key=${KEY}&file=vox2_test_aac.zip"


# Extraction part:

#VoxCeleb1:

echo "Extracting vox1_dev_txt..."
unzip -n $VOX1_DEV_FOLDER/vox1_dev_txt.zip -d $VOX1_DEV_FOLDER
rm $VOX1_DEV_FOLDER/vox1_dev_txt.zip
echo "Extracting vox1_dev_wav..."
unzip -n $VOX1_DEV_FOLDER/vox1_dev_wav.zip -d $VOX1_DEV_FOLDER
rm $VOX1_DEV_FOLDER/vox1_dev_wav.zip

echo "Extracting vox1_test_txt..."
unzip -n $VOX1_TEST_FOLDER/vox1_test_txt.zip -d $VOX1_TEST_FOLDER
rm $VOX1_TEST_FOLDER/vox1_test_txt.zip
echo "Extracting vox1_dev_wav.zip..."
unzip -n $VOX1_TEST_FOLDER/vox1_test_wav.zip -d $VOX1_TEST_FOLDER
rm $VOX1_TEST_FOLDER/vox1_test_wav.zip

#VoxCeleb2:

echo "Extracting vox2_dev_txt..."
unzip -n $VOX2_DEV_FOLDER/vox2_dev_txt.zip -d $VOX2_DEV_FOLDER
rm -$VOX2_DEV_FOLDER/vox2_dev_txt.zip
echo "Extracting vox2_dev_aac..."
unzip -n $VOX2_DEV_FOLDER/vox2_dev_aac.zip -d $VOX2_DEV_FOLDER
rm $VOX2_DEV_FOLDER/vox2_dev_aac.zip

echo "Extracting vox2_test_txt..."
unzip -n $VOX2_TEST_FOLDER/vox2_test_txt.zip -d $VOX2_TEST_FOLDER
rm $VOX2_TEST_FOLDER/vox2_test_txt.zip
echo "Extracting vox2_test_aac..."
unzip -n $VOX2_TEST_FOLDER/vox2_test_aac.zip -d $VOX2_TEST_FOLDER
rm $VOX2_TEST_FOLDER/vox2_test_aac.zip
