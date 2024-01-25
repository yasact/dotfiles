#!/bin/bash -xe

# setOsType
#
# osを判別する
function setOsType() {
    if # echo "function setOsType runned"
        # macの場合
        [[ "$OSTYPE" == "darwin"* ]]
    then
        ostype="mac"
    # WSLの場合
    elif grep -qi microsoft /proc/version; then
        ostype='wsl'
    # それ以外の場合
    else
        ostype="linux"
    fi
}
