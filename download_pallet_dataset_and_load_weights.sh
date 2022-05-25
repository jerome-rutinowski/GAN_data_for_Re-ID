mkdir datasets
FILE="GAN_data_for_Re-ID"
URL=https://zenodo.org/record/6580127/files/$FILE.zip?download=1
ZIP_FILE=./datasets/$FILE.zip
TARGET_DIR=./datasets/pallet-block-502/
wget -N $URL -O $ZIP_FILE
mkdir $TARGET_DIR
unzip -j $ZIP_FILE CycleGAN\ checkpoints/* -d ./output/pallet-block-502/checkpoints/   #extract the GAN checkpoints
unzip -j $ZIP_FILE Classifier\ model/* -d ./model_classifier_C_RL/   #extract the classifier weights
mkdir $TARGET_DIR/trainC
mkdir $TARGET_DIR/testC
unzip -j $ZIP_FILE CycleGAN\ input\ \&\ output/Unfiltered/C/* -d $TARGET_DIR/trainC
mv $TARGET_DIR/trainC/cropped_5*.jpeg $TARGET_DIR/testC
mkdir $TARGET_DIR/trainRL
mkdir $TARGET_DIR/testRL
unzip -j $ZIP_FILE CycleGAN\ input\ \&\ output/Unfiltered/RL/* -d $TARGET_DIR/trainRL
mv $TARGET_DIR/trainRL/cropped_5*.jpeg $TARGET_DIR/testRL
rm $ZIP_FILE
