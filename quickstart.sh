#!/usr/bin/env bash
set -e

if [ "$(uname)" == "Darwin" ]; then
  KEYCHAIN_SERVICE="${KEYCHAIN_SERVICE:-Sphinx_Confluence}"
  CONFLUENCE_PARENT="${CONFLUENCE_PARENT}"
  sphinx-quickstart -l en --extension=myst_parser --extension=sphinxcontrib.confluencebuilder --extension=sphinxcontrib.plantuml --extension=sphinx.ext.graphviz --extension=rinoh.frontend.sphinx --extension=sphinxcontrib.drawio --sep --master="index" -t .templates -d confluence_keychain_service=$KEYCHAIN_SERVICE -d confluence_parent="$CONFLUENCE_PARENT" docs
  if brew ls --versions "plantuml" >/dev/null; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "plantuml"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew install "plantuml"
  fi
  mv docs/source/index.rst docs/source/index.md
  git add docs
  PASSWORD=`security find-generic-password -s "$KEYCHAIN_SERVICE" -a "$USER" 2>/dev/null` || true
  if [[ "$PASSWORD" == "" ]]; then
    echo -e '\n\n\n'
    echo "Adding Confluence password to KeyChain..."
    security add-generic-password -s "$KEYCHAIN_SERVICE" -a "$USER" -p
  fi
else
  echo "This template assumes OSX. Sorry..."
fi