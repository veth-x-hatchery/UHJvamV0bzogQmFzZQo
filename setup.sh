#!/bin/sh

# chechout

brew install gnupg

git checkout develop

# infrastructure

(cd .. && git clone git@ssh.dev.azure.com:v3/UGxheWdyb3VuZAo/UHJvamV0bzogU2VjcmV0cwo/UHJvamV0bzogU2VjcmV0cwo)

# scripts

(cd .. && git clone git@ssh.dev.azure.com:v3/UGxheWdyb3VuZAo/U2NyaXB0cwo/U2NyaXB0cwo)

# decrypt infrastructure .files

../U2NyaXB0cwo/decrypt.sh ../UHJvamV0bzogU2VjcmV0cwo

# Google Files

../U2NyaXB0cwo/google_service.sh ../UHJvamV0bzogU2VjcmV0cwo .

# .env paths

export PROJECT_PATH=${PWD}

export PROJECT_GLOBAL_VAR=${PWD%/*}/UHJvamV0bzogU2VjcmV0cwo/.files

bundle update fastlane

# Fastlane Match iOS

(cd ./src/ios && bundle exec fastlane install_match_dependencies)

# Fastlane Firebase Deploys

(cd ./src/ios && bundle exec fastlane deploy_firebase)

# remove files

rm -rf ../U2NyaXB0cwo ../UHJvamV0bzogU2VjcmV0cwo