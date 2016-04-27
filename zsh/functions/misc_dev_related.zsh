function vreinstall() {
    sudo modprobe vboxdrv
    sudo /etc/init.d/virtualbox start
}

function npm_reset() {
    rm -r node_modules
    npm cache clean
    npm install
}

function vdo { ssh default "/bin/bash -l -c '$*'" }

function crun() {
    if [[ ! $1 ]]; then
        echo "no target supplied, just building"
        make
    elif [[ -f $1 && $1 = *.c ]]; then
        target=$(echo $1 | sed 's/\(.*\)\..*/\1/')
        if [[ -f $target ]]; then
            rm $target
        fi
        make $target
        ./$target
    else
        if [[ -f $1 ]]; then
            rm $1
        fi
        make $1
        ./$1
    fi
}

function gorun() {
    go build $1 && ./$( $1 | sed 's/\..*$//')
}
