#!/bin/sh

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf public
git clone .git --branch gh-pages public
hugo
cd public 
echo "pushing..."
git add --all && git commit -m "Publishing to gh-pages" && git push origin gh-pages
echo "done"