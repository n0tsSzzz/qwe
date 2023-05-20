#!/bin/bash

while getopts "f:o:t:" opt; do
    case "$opt" in
        f)
            in=$OPTARG
        ;;
        o)
            out=${OPTARG:-out\.txt}
        ;;
        t)
            places=${OPTARG:-5}
        ;;
    esac
done



cat $in | sort | sed -e 's/ G/ 1G/g' -e 's/ S/ 2S/g' -e 's/ N/ 3N/g' | sort --stable -k 2r -k 3g -k 4   |  \
    sed -e 's/ 1G/ G/g' -e 's/ 2S/ S/g' -e 's/ 3N/ N/g' | head --lines=$places > $out



