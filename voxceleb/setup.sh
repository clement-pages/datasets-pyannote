#!/bin/bash

VOX1_DEV_FOLDER="./VoxCeleb1/dev"
VOX1_TEST_FOLDER="./VoxCeleb1/test"
VOX2_DEV_FOLDER="./VoxCeleb2/dev"
VOX2_TEST_FOLDER="./VoxCeleb2/test"

DOWNLOAD_URL="https://cn01.mmai.io/download/voxceleb?key=1dea83ac64cb4595e8ece4ed721e258167aee865fd6deabd100b7c0f248e6dd1d7f08575f3a3580f76d736671e6b29ed47351339e03a3746cec94bba6d09392d0da4c0511634095b6fe1aae7477f25eefeca3e5df1d0454a11321975dc3a22e9ae639980ceaccf61410e1f41f521b6b3131b49f8d254656da316fd744348782a&file="

# Downloading part:

#VoxCeleb1:

echo "Downloading VoxCeleb1 development dataset..."
mkdir -p $VOX1_DEV_FOLDER
wget -c -P $VOX1_DEV_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox1_dev_txt.zip"
wget -c -O $VOX1_DEV_FOLDER/vox1_dev_wav_partaa --no-check-certificate "${DOWNLOAD_URL}vox1_dev_wav_partaa"
wget -c -O $VOX1_DEV_FOLDER/vox1_dev_wav_partab --no-check-certificate "${DOWNLOAD_URL}vox1_dev_wav_partab"
wget -c -O $VOX1_DEV_FOLDER/vox1_dev_wav_partac --no-check-certificate "${DOWNLOAD_URL}vox1_dev_wav_partac"
wget -c -O $VOX1_DEV_FOLDER/vox1_dev_wav_partad--no-check-certificate "${DOWNLOAD_URL}vox1_dev_wav_partad"
$VOX1_DEV_FOLDER/vox1_dev* > vox1_dev_wav.zip

echo "Downloading VoxCeleb1 test dataset..."
mkdir -p $VOX1_TEST_FOLDER
wget -c -P $VOX1_TEST_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox1_test_txt.zip"
wget -c -P $VOX1_TEST_FOLDER "${DOWNLOAD_URL}vox1_test_wav.zip"

#VoxCeleb2:

echo "Downloading VoxCeleb2 development dataset..."
mkdir -p $VOX2_DEV_FOLDER
wget -c -P $VOX2_DEV_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox2_dev_txt.zip"
wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_partaa --no-check-certificate "${DOWNLOAD_URL}vox2_dev_aac_partaa"
wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_partab "${DOWNLOAD_URL}vox2_dev_aac_partab"
wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_partac "${DOWNLOAD_URL}vox2_dev_aac_partac"
wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_partad "${DOWNLOAD_URL}vox2_dev_aac_partad"
wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_partae "${DOWNLOAD_URL}vox2_dev_aac_partae"
wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_partaf "${DOWNLOAD_URL}vox2_dev_aac_partaf"
wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_partag"${DOWNLOAD_URL}vox2_dev_aac_partag"
wget -c -O $VOX2_DEV_FOLDER/vox2_dev_aac_partah "${DOWNLOAD_URL}vox2_dev_aac_partah"
$VOX2_DEV_FOLDER/vox2_dev_aac* > vox2_dev_aac.zip

echo "Downloading VoxCeleb2 test dataset..."
mkdir $VOX2_TEST_FOLDER
wget -c -P $VOX2_TEST_FOLDER "https://mm.kaist.ac.kr/datasets/voxceleb/data/vox2_test_txt.zip"
wget -c -P $VOX2_TEST_FOLDER --no-check-certificate "${DOWNLOAD_URL}vox2_test_aac.zip"


# Extraction part:

#VoxCeleb1:

echo "Extracting vox1_dev_txt..."
unzip $VOX1_DEV_FOLDER/vox1_dev_txt.zip -d $VOX1_DEV_FOLDER
rm -rd $VOX1_DEV_FOLDER/vox1_dev_txt.zip
echo "Extracting vox1_dev_wav..."
unzip $VOX1_DEV_FOLDER/vox1_dev_wav.zip -d $VOX1_DEV_FOLDER
rm -rd $VOX1_DEV_FOLDER/vox1_dev_wav.zip

echo "Extracting vox1_test_txt..."
unzip $VOX1_TEST_FOLDER/vox1_test_txt.zip -d $VOX1_TEST_FOLDER
rm -rd $VOX1_TEST_FOLDER/vox1_test_txt.zip
echo "Extracting vox1_dev_wav.zip..."
unzip $VOX1_TEST_FOLDER/vox1_test_wav.zip -d $VOX1_TEST_FOLDER

#VoxCeleb2:

echo "Extracting vox2_dev_txt..."
unzip $VOX2_DEV_FOLDER/vox2_dev_txt.zip -d $VOX2_DEV_FOLDER
rm -rd $VOX2_DEV_FOLDER/vox2_dev_txt.zip
echo "Extracting vox2_dev_aac..."
unzip $VOX2_DEV_FOLER/vox2_dev_aac.zip -d $VOX2_DEV_FOLDER
rm -rd $VOX2_DEV_FOLDER/vox2_dev_aac.zip

echo "Extracting vox2_test_txt..."
unzip $VOX2_TEST_FOLDER/vox2_test_txt.zip -d $VOX2_TEST_FOLDER
rm -rd $VOX2_TEST_FOLDER/vox2_test_txt.zip
echo "Extracting vox2_test_aac..."
unzip $VOX2_TEST_FOLDER/vox2_test_aac.zip -d $VOX2_TEST_FOLDER
rm -rd $VOX2_TEST_FOLDER/vox2_test_aac.zip


