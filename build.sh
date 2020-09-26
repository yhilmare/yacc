#!/bin/bash
# 自动构建脚本
set -e;

ROOT_DIR=`pwd`

function main() {
    local PARAMETER=${1:-clear}
    case ${PARAMETER} in
        "clear")
            general_scan "clear"
            ;;
        "build")
            general_scan "build"
            ;;
        *)
            echo "./build.sh [OPTS]"
            echo "clear = clear all libs"
            echo "build = clear and build all libs"
            ;;
    esac
}

function general_scan() {
    local PARAM=${1:-clear}
    for line in `ls $ROOT_DIR/src/libs`; do
        local ITEM_NAME=$ROOT_DIR/src/libs/${line}
        if [ -d ${ITEM_NAME} ]; then
            local BUILD_DIR=$ITEM_NAME/build
            case ${PARAM} in
                "build")
                    if [ -ne ${ITEM_NAME}/CMakeLists.txt]; then
                        echo `date`" \""${ITEM_NAME}"/CMakeLists.txt\" is not existed"
                        break
                    fi
                    if [ -e $BUILD_DIR ]; then
                        rm -rf $BUILD_DIR/*                    
                        cd $BUILD_DIR && cmake .. && make
                        echo `date`"current build dir \""$BUILD_DIR"\" has already been built"
                    else
                        echo `date`"target dir \""$BUILD_DIR"\" is not existed"
                    fi
                    ;;
                "clear")
                    if [ -e $BUILD_DIR ]; then
                        rm -rf $BUILD_DIR/*
                        echo `date`" current build dir \""$BUILD_DIR"\" has already been cleared"
                    else
                        echo `date`" target dir \""$BUILD_DIR"\" is not existed"
                    fi
                    ;;
                *)
                    ;;
            esac
        fi
    done
}

main $*
