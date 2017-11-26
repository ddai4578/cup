#!/bin/bash

config_file=config.cmake
project_name=${PWD##*/}
make_bits=64Bits

if [ -n "$1" ]; then
    project_name=$1
fi

if [ -f ${config_file} ]; then
   rm -f ${config_file}
fi

if [ "$2" == "32Bits" ]; then
    make_bits="32Bits"
elif [ -z "$2" ]; then
    echo "Now the project will be complied as 64 Bits "
else
    echo "Invalid input $2, it will be complied as 64 Bits, You can give 32Bits as 32Bits"
fi

echo "set (proj_name \"${project_name}\")" >> ${config_file}
echo "set (c_type \"${make_bits}\")" >> ${config_file}


echo "========================"
echo "This project is Configed as followed:"
cat ${config_file}
