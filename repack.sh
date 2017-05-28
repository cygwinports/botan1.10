#! /bin/bash

eval `grep '^VERSION' botan*.cygport`
name=Botan-${VERSION}
src=${name}.tgz
dst=${name}.stripped.tar.gz

rm -f ${dst} ${dst%.gz}
cp -av ${src} ${dst}

gzip -d ${dst}

tar --delete --file=${dst%.gz} \
    ${name}/src/block/rc6 \
    ${name}/src/block/rc5 \
    ${name}/src/pubkey/gost_3410

touch -m -r ${src} ${dst%.gz}

gzip ${dst%.gz}

