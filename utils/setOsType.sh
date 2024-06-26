# setOsType
#
# osを判別する
function setOsType() {
    # macの場合
    if [[ "$OSTYPE" == "darwin"* ]]; then
        ostype="mac"
    # WSLの場合
    elif grep -qi microsoft /proc/version; then
        ostype='wsl'
    # それ以外の場合
    else
        ostype="linux"
    fi

    echo This OS is $ostype
}
