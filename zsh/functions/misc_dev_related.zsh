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
    go build $1 && ./$( echo $1 | sed 's/\..*$//') && rm ./$( echo $1 | sed 's/\..*$//')
}

function freplace() {
    ag -l $1 | xargs sed -i '' -e $2
}

function docker_js_upgrade() {
    docker-compose run watch npm install --save $1@latest
}

function get_package_name() {
    echo "$1" | sed 's/ .*//g'
}

function docker_js_upgrade_all() {
    IFS=$'\n'
    for package in $(npm outdated | tail -n +2); do
        to_upgrade=$(get_package_name $package)
        echo "upgrading $to_upgrade"
        docker_js_upgrade $to_upgrade
    done
}

