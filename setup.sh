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

echo "═════════════════════════════════════════════════════════════════════════════════"
echo "══╡ Platform: $platform / Lane: $lane"
echo "═════════════════════════════════════════════════════════════════════════════════"

################################# PACKAGES INSTALL ############################################

# gnupg

brew install gnupg

# bundler

(cd ./src/$platform \
&& gem install bundler \
&& bundle add fastlane \
&& bundle install)

##################################### TEMP .ENV ################################################

export PROJECT_INFRA_GIT_PATH="git@ssh.dev.azure.com:v3/UGxheWdyb3VuZAo/UHJvamV0bzogU2VjcmV0cwo/UHJvamV0bzogU2VjcmV0cwo"
export PROJECT_INFRA_FOLDER="UHJvamV0bzogU2VjcmV0cwo"

export PROJECT_SCRIPTS_GIT_PATH="git@ssh.dev.azure.com:v3/UGxheWdyb3VuZAo/U2NyaXB0cwo/U2NyaXB0cwo"
export PROJECT_SCRIPTS_FOLDER="U2NyaXB0cwo"

export PROJECT_PATH=${PWD}
export TEMP_FILES_PATH=${PWD%/*}
export PROJECT_GLOBAL_VAR="$TEMP_FILES_PATH/$PROJECT_INFRA_FOLDER/.files"

export YXNkZgo="HF17vs#qtl7V2LFcFDWc5qaR3nHw2bN7B7Z\$CjTizC8j^nKQnobTyBFqTj3hxUhs"
export TEMP_KEYCHAIN_NAME="continuous.keychain"
export TEMP_KEYCHAIN_PASSWORD="SeHjQdweLCv6aCI8HUQCnbmM8FKqhH0ibQZVDq05zU0giqjAuOd97GPbP7uPOT7f"

##################################### UNPACKING ################################################

git checkout develop

# infrastructure

(cd $TEMP_FILES_PATH && git clone $PROJECT_INFRA_GIT_PATH)

# scripts

(cd $TEMP_FILES_PATH && git clone $PROJECT_SCRIPTS_GIT_PATH)

# decrypting infrastructure .files

(cd "$TEMP_FILES_PATH/$PROJECT_SCRIPTS_FOLDER" && \
chmod +x ./decrypt.sh && \
./decrypt.sh "$TEMP_FILES_PATH/$PROJECT_INFRA_FOLDER")

# copying google files

(cd "$TEMP_FILES_PATH/$PROJECT_SCRIPTS_FOLDER" && \
chmod +x ./env_files.sh && \
./env_files.sh "$TEMP_FILES_PATH/$PROJECT_INFRA_FOLDER" $PROJECT_PATH)

# fastlane firebase deploy

(cd ./src/$platform && bundle exec fastlane $lane)

# dispose temp files

rm -rf \
"$TEMP_FILES_PATH/$PROJECT_SCRIPTS_FOLDER" \
"$TEMP_FILES_PATH/$PROJECT_INFRA_FOLDER"