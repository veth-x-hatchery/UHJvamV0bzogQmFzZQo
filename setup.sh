#!/bin/bash

# LOG OPTIONS
# ./setup.sh > /dev/null
# ./setup.sh > script.log 2>&1
# LOG=$(./setup.sh)
#

set -a

if [ -n "$1" ]; then
    platform="$1"
else
    platform="ios"
fi

if [ -n "$2" ]; then
    lane="$2"
else
    lane="load_env"
fi

dispose() {
    echo 
    echo "═══════════════════════════════════════════════════════════════════════════════════════════"
    echo "══╡ Disposing temp files ╞═════════════════════════════════════════════════════════════════"
    echo "═══════════════════════════════════════════════════════════════════════════════════════════"
    echo
    [ -z "$PROJECT_FROM_LOCALHOST" ] && rm -rf \
    $PROJECT_SCRIPTS_PATH \
    $PROJECT_INFRA_PATH \
    $PROJECT_PATH
}

exitfn () {
    trap SIGINT              # Restore signal handling for SIGINT
    echo
    echo "══╡ CANCELLED ╞═════════════════════════════════════════════════════════════════"
    echo
    dispose
    exit                     #   then exit script.
}

# set up SIGINT trap to call function
trap "exitfn" INT

echo
echo "*******************************************************************************************"
echo "*** Platform: $platform / Lane: $lane"
echo "*******************************************************************************************"

if [ -f ./bashrc.sh ]; then
echo
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ TEMP .ENV from ./bashrc.sh ╞═══════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 
source ./bashrc.sh
fi

export PROJECT_PATH=${PWD}

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ PACKAGES INSTALL ╞═════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

if [ -z "$PROJECT_FROM_LOCALHOST" ]; then
    # gnupg

    brew install gnupg

    # bundler

    (cd ./src/$platform \
    && gem install bundler \
    && bundle add fastlane \
    && bundle install)
fi

{

# # restore signal handling to previous before exit.
# trap SIGINT

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ Infrastructure ╞═══════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

[ -z "$PROJECT_FROM_LOCALHOST" ] && git clone $PROJECT_INFRA_GIT_URL $PROJECT_INFRA_PATH

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ Scripts ╞══════════════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

[ -z "$PROJECT_FROM_LOCALHOST" ] && git clone $PROJECT_SCRIPTS_GIT_URL $PROJECT_SCRIPTS_PATH

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ Copying environment files ╞════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

(cd $PROJECT_SCRIPTS_PATH && chmod +x ./env_files.sh && ./env_files.sh)

echo
echo "*******************************************************************************************"
echo "*** Fastlane: $lane"
echo "*******************************************************************************************"
echo

(cd ./src/$platform && bundle exec fastlane $lane)

}|| {
    echo "══╡ ERROR! ╞═════════════════════════════════════════════════════════════════"
}

dispose