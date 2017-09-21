#!/bin/sh

registry="registry.prod.grace.surfsara.nl:5000"
group="sda"
image="notebook"
version=$(awk '$1 == "LABEL" && $2 == "version" { v=$3; gsub(/"/, "", v); print v }' Dockerfile)

usage() {
   echo "Usage: ./make.sh build|push [version]"
   echo ""
   exit 1
}

do_build() {
    echo "Building image $tag"
    echo ""
    docker build -t "$tag" $PWD
}

do_push() {
    echo "Pushing image $tag"
    echo ""
    sleep 5
    docker push "$tag"
}

if [ "$#" -lt 1 ]; then
   usage
else
    if [ "$#" -ge 2 ]; then
       version="$2"
    fi

    tag="$registry/$group/$image:$version"

    case $1 in 
        build) do_build ;;
        push)  do_push  ;;
        *)     usage    ;;
    esac
fi

