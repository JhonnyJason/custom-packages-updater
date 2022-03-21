#!/bin/bash
cd /home/builder/builds/custom-package-script/
uptodate=$(git pull origin master | gawk '{if($0=="Already up to date.") print "yes"}')
if [ $uptodate == "yes" ]
then
    echo "nothing to do."
else
    echo "do update."
    ./create-packages.sh
    cd /home/builder/repo-packages/custom-packages/
    repo-add custom-packages.db.tar.xz *.pkg.tar.xz -R -s
    echo "done."
fi