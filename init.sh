#!/bin/sh

HERE=$(pwd)
echo "We are here: $HERE"
PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]
then
   echo "usage: $0 testproj"
   echo "The script will replace all project names with the arg 1 and you can start development"
   exit
fi

echo "Got $PROJECT_NAME as new name..."

echo "Delete .git - you need to create a new repo..."
rm -rf .git

echo "Installing catch..."
cd $HERE/test/thirdparty/catch
wget https://raw.githubusercontent.com/catchorg/Catch2/master/single_include/catch2/catch.hpp
cd $HERE

echo "Renaming testproj to $PROJECT_NAME"
find . -type f -exec sed -i "s/PROJECTNAME/$PROJECT_NAME/g" {} +

mv include/PROJECTNAME include/$PROJECT_NAME
mv include/$PROJECT_NAME/PROJECTNAMEVersion.h.in include/$PROJECT_NAME/$PROJECT_NAMEVersion.h.in

echo "kill myself"
cd $HERE
rm init.sh

echo "Renaming myself..."
cd ..
mv CMAKEBasic $PROJECT_NAME
cd $PROJECT_NAME
