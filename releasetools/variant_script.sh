#!/sbin/sh

set -e

modelid=`getprop ro.boot.mid`

case $modelid in
    "0P3P10000") variant="vzw" ;;
    "0P3P20000") variant="dwg" ;;
    "0P3P30000") variant="dug" ;;
    "0P3P40000") variant="tl" ;;
    "0P3P70000") variant="spr" ;;
    *)           variant="gsm" ;;
esac

basedir="/system/blobs/$variant/"
cd $basedir
chmod 755 bin/*
find . -type f | while read file; do ln -s $basedir$file /system/$file ; done
