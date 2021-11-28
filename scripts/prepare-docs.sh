#!/bin/bash

echo 'test'


OUTDIR=docs/pages/

rm -rf "$OUTDIR"

npx solidity-docgen \
  -t docs/templates \
  -o "$OUTDIR" \
  -i contracts/creators,contracts/roylties,contracts/shop,contracts/tokens \
  --solc-module solc-0.8
