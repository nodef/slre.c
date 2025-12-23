#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -d "slre" ]; then return; fi
URL="https://github.com/aquefir/slre/archive/refs/heads/master.zip"
ZIP="${URL##*/}"
DIR="slre-master"
mkdir -p .build
cd .build

# Download the release
if [ ! -f "$ZIP" ]; then
  echo "Downloading $ZIP from $URL ..."
  curl -L "$URL" -o "$ZIP"
  echo ""
fi

# Unzip the release
if [ ! -d "$DIR" ]; then
  echo "Unzipping $ZIP to .build/$DIR ..."
  cp "$ZIP" "$ZIP.bak"
  unzip -q "$ZIP"
  rm "$ZIP"
  mv "$ZIP.bak" "$ZIP"
  echo ""
fi
cd ..

# Copy the libs to the package directory
echo "Copying libs to slre/ ..."
rm -rf slre
mkdir -p slre
cp -f ".build/$DIR/slre.h" "slre/slre.h"
cp -f ".build/$DIR/slre.c" "slre/slre.c"
echo ""
}


# Test the project
test() {
echo "Running 01-simple-match.c ..."
clang -I. -o 01.exe examples/01-simple-match.c     && ./01 && echo -e "\n"
echo "Running 02-email-validation.c ..."
clang -I. -o 02.exe examples/02-email-validation.c && ./02 && echo -e "\n"
echo "Running 03-url-extraction.c ..."
clang -I. -o 03.exe examples/03-url-extraction.c   && ./03 && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
