#!/bin/bash

oldname=$1

newname=$(echo $oldname | tr 'A-Z' 'a-z')

mv $oldname $newname

