## Setup 

Add `telegram.token` file with valid API token.

## Usage


`docker run -it --rm -v"$(pwd):/data" gospider $URL_File`

File structure:

`https://www.redguard.ch`


I will go to hell for this one. 
```
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
if [[ -f gospider-input.txt ]]
then
        cat gospider-input.txt | cut -d " " -f1 | rev | cut -c5- | rev
fi
cd ..
done
```

## Purpose

Crawl domain list for links and parameter. 

