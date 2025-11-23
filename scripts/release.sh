#!/bin/bash
# build_for_tawakkalna.sh

echo "Building for Tawakkalna release..."

# Navigate to example app directory
cd example

read -p "Clean example build folder? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -rf build
    echo "Example build folder cleaned"
fi

Build the app
flutter build web --release

# Remove unnecessary files
echo "Cleaning up unnecessary files..."
rm -f build/web/assets/packages/tawakkalna_sdk_flutter/assets/web/twkhelper_mock.js
rm -f build/web/assets/assets/mock_profile1.0.2.json

# Optional: Remove CanvasKit to reduce size
read -p "Remove CanvasKit to reduce bundle size? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -rf build/web/canvaskit
    echo "CanvasKit removed"
fi

# Create zip file
cd build
APP_NAME=$(grep "name:" ../pubspec.yaml | awk '{print $2}')
VERSION=$(grep "version:" ../pubspec.yaml | awk '{print $2}')
ZIP_NAME="${APP_NAME}_v${VERSION}.zip"


# cd web
zip -r "$ZIP_NAME" web/* -i 'web/*'

GREEN='\033[0;32m'
echo "${GREEN}Package created: $(pwd)/$ZIP_NAME"
echo -e "\033[0m"

FILE_SIZE_MB=$(ls -l "$ZIP_NAME" | awk '{print $5/1024/1024}')
COLOR='\033[1;33m'

echo "${COLOR}Package size: ${FILE_SIZE_MB}MB"