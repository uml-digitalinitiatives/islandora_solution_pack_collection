#!/bin/bash

if [ -n "${TRAVIS_PHP_VERSION}" ]; then
  if [ "${TRAVIS_PHP_VERSION}" == "5.3.3" ]; then
    drush coder-review --reviews=production,security,style,i18n,potx,sniffer islandora_basic_collection
  else
    $TOOLS_DIR/vendor/bin/phpcs --standard=drupal,drupalpractice --ignore=vendor,*.md,*.info,*.txt sites/all/modules/islandora_basic_collection
  fi
else
    echo "Unable to determine PHP version"
    exit 1
fi