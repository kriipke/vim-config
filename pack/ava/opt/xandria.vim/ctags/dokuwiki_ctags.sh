#!/bin/bash

header_re='/^(={1,6})\s*?(.*)\s*?\1/\2/h,heading,headings/' 
keyword_re='/<kw>(.*)<\/kw>/\1/kw,keyword,keywords/'

ctags --langdef=dokuwiki --langmap=dokuwiki:.txt \
    --regex-dokuwiki="$header_re" ${1-$(pwd)}/* 

ctags --langdef=dokuwiki --langmap=dokuwiki:.txt \
    --regex-dokuwiki="$keyword_re" ${1-$(pwd)}/* 

awk -F'\t' '{ printf "%30-s %35-s %s\n", , ,  }' tags
