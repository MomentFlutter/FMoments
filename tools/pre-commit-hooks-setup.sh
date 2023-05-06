#!/bin/bash

file='.git/hooks/pre-commit'
gitFolder='.git'
if [ ! -f $gitFolder ]
then
    echo 'git not initialised'

elif [ ! -f $file ]
then
    echo 'No Talisman hook available. Setting up the hook now..'
    echo 'Copying Talisman pre-commit hook to your git hooks'
    curl https://thoughtworks.github.io/talisman/install.sh > ~/install-talisman.sh
    chmod +x ~/install-talisman.sh

    ~/install-talisman.sh pre-commit
    echo "if [ \$? -ne 0 ]; then
          exit 1
    fi" >> $file

    echo "make run/analyze" >> $file
    echo "if [ \$? -ne 0 ]; then
      exit 1
    fi" >> $file
    echo "make run/format" >> $file
    echo "make run/test" >> $file

    echo "Flutter analyze and format command added to hooks"
else
    echo 'A pre-commit hook already exists. Ensure Talisman check, Flutter analyze, format and test command is also part of your pre-commit hook'
fi
