#!/usr/bin/env bash
set -ev

case ${ENV} in
    node) mocha ;;
    phantomjs) npm run test:phantomjs ;;
    chrome)
        sudo apt-get update
        sudo apt-get install -y libappindicator1 fonts-liberation
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i google-chrome*.deb
        export CHROME_BIN=/usr/bin/google-chrome
        karma start --browsers ChromeTravisCI --single-run
        ;;
    firefox*) karma start --browsers Firefox --single-run ;;
    *) echo "Unknown \${ENV}: ${ENV}"; exit 1 ;;
esac
