#!/bin/sh

if [ -n "$1" ]; then
    platform="$1"
else
    platform="ios"
fi

if [ -n "$2" ]; then
    lane="$2"
else
    lane="deploy_firebase"
fi

echo
echo "*******************************************************************************************"
echo "*** Platform: $platform / Lane: $lane"
echo "*******************************************************************************************"
echo

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ PACKAGES INSTALL ╞═════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

# gnupg

brew install gnupg

# bundler

(cd ./src/$platform \
&& gem install bundler \
&& bundle add fastlane \
&& bundle install)

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ TEMP .ENV ╞════════════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

export PROJECT_PATH=${PWD}
export TEMP_FILES_PATH="/tmp" #${PWD%/*}

export PROJECT_INFRA_GIT_URL="git@ssh.dev.azure.com:v3/UGxheWdyb3VuZAo/UHJvamV0bzogU2VjcmV0cwo/UHJvamV0bzogU2VjcmV0cwo"
export PROJECT_INFRA_PATH="$TEMP_FILES_PATH/UHJvamV0bzogU2VjcmV0cwo"

export PROJECT_SCRIPTS_GIT_URL="git@ssh.dev.azure.com:v3/UGxheWdyb3VuZAo/U2NyaXB0cwo/U2NyaXB0cwo"
export PROJECT_SCRIPTS_PATH="$TEMP_FILES_PATH/U2NyaXB0cwo"

export YXNkZgo="HF17vs#qtl7V2LFcFDWc5qaR3nHw2bN7B7Z\$CjTizC8j^nKQnobTyBFqTj3hxUhs"
export TEMP_KEYCHAIN_NAME="continuous.keychain"
export TEMP_KEYCHAIN_PASSWORD="SeHjQdweLCv6aCI8HUQCnbmM8FKqhH0ibQZVDq05zU0giqjAuOd97GPbP7uPOT7f"

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ UNPACKING ╞════════════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

git checkout develop

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ Infrastructure ╞═══════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

(cd $TEMP_FILES_PATH && git clone $PROJECT_INFRA_GIT_URL)

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ Scripts ╞══════════════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

(cd $TEMP_FILES_PATH && git clone $PROJECT_SCRIPTS_GIT_URL)

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ Copying environment files ╞════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo 

(cd $PROJECT_SCRIPTS_PATH && \
chmod +x ./env_files.sh && ./env_files.sh)

echo
echo "*******************************************************************************************"
echo "*** Fastlane: $lane"
echo "*******************************************************************************************"
echo

(cd ./src/$platform && bundle exec fastlane $lane)

echo 
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ Disposing temp files ╞═════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo

rm -rf \
$PROJECT_SCRIPTS_PATH \
$PROJECT_INFRA_PATH