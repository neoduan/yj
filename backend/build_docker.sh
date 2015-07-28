#!/bin/bash
ROOT_DIR=`pwd`
PRJ='date_fitness'

export GOPATH=$ROOT_DIR
export GOBIN=$ROOT_DIR/bin

echo "**********************************Strat****************************"

echo "Init env..."
echo "GOPATH is :$GOPATH"
echo "GOBIN  is :$GOBIN"

echo "It is deploying hera, please wait..."
go get github.com/xcodecraft/hera
echo "hera deploy success."

rm -rf $GOPATH/pkg/ $GOPATH/bin/
echo "It is complie your prj, please wait..."
#go get gopkg.in/mgo.v2
go install main
echo "complie success."

case $1 in
    start)
        echo "$PRJ start:"
        /usr/bin/python  /usr/local/bin/zdaemon  -C $ROOT_DIR/conf/zd.xml start
        ;;
    stop)
        echo "$PRJ stop:"
        /usr/bin/python  /usr/local/bin/zdaemon  -C $ROOT_DIR/conf/zd.xml stop
        ;;
    restart)
        echo "$PRJ restart:"
        /usr/bin/python  /usr/local/bin/zdaemon  -C $ROOT_DIR/conf/zd.xml restart
        ;;
esac


echo "**********************************End****************************"

while true;do sleep 1000;done
