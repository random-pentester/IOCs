#!/bin/bash
base='/tmp/ioc/'
working=${base}working/

mkdir -p $working
cd $working
while read p; do
	git clone $p
	find . -type f -exec sha256sum {} + | awk '{print $1}' | anew ${base}IOCS.lst
	rm -r ${working}*
done < ${base}github_repos.lst
