#!/bin/bash
function single_or_split() {
if $(rg -q 'package\(\) \{' PKGBUILD)
  then
echo PACKAGE IS SINGULAR 
elif  $(rg -q 'pkgbase=' PKGBUILD) 
  then
echo PACKAGE IS SPLIT 
fi
}
single_or_split
