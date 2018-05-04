#!/bin/bash

if [ -n "${TRAVIS_PHP_VERSION}" ]; then
  if [ "${TRAVIS_PHP_VERSION}" != "5.3.3" ]; then
    # Setup phpcs and drupal sniffs.
    mkdir $TOOLS_DIR
    cd $TOOLS_DIR
    composer require drupal/coder
    composer require dealerdirect/phpcodesniffer-composer-installer
    $TOOLS_DIR/vendor/bin/phpcs -i
    $TOOLS_DIR/vendor/bin/phpcs --version
  fi
else
    echo "Unable to determine PHP version"
    exit 1
fi