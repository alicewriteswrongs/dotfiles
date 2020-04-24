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

function get_npm_package_name() {
    echo "$1" | sed 's/ .*//g'
}

function docker_js_upgrade_all() {
    IFS=$'\n'
    for package in $(npm outdated | tail -n +2); do
        to_upgrade=$(get_npm_package_name $package)
        echo "upgrading $to_upgrade"
        docker_js_upgrade $to_upgrade
    done
}

function js_upgrade_all() {
    IFS=$'\n'
    for package in $(npm outdated | tail -n +2); do
        to_upgrade=$(get_npm_package_name $package)
        echo "upgrading $to_upgrade"
        npm install --save $to_upgrade@latest
    done
}

function setjstest() {
    jstest=$(ag -g test.js | fzf-tmux)
    echo 'running '$jstest
    djstest $jstest
    export lasttest=$jstest
}

function jstest() {
    if [ -z ${lasttest+1} ]; then
        setjstest
    else
        echo 'running '$jstest
        djstest $lasttest
    fi
}

function fmtfast() {
    changed=$(git status -s | sed 's/^\s\S\s//' | tr '\n' ' ')
    for file in $(git status -s | sed 's/^\s\S\s//'); do
        ./node_modules/.bin/prettier-eslint --write --no-semi $file
    done
}
