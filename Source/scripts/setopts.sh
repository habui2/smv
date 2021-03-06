#!/bin/bash
SIZE="-m64"
COMPILER="icc"
COMPILER2="icc"
CFLAGOPT=
QUARTZ=
PLATFORM=""
while getopts '36c:ghitq' OPTION
do
case $OPTION in
  h)
  echo "options:"
  echo "-3 - build a 32 bit version"
  echo "-t - build a 32 bit version but don't use -m32 option"
  echo "-6 - build a 64 bit version"
  echo "-c - add CFLAG option (for the Mac for now)"
  echo "-g - use the gcc compiler"
  echo "-i - use the Intel icc compiler"
  echo "-q - using Quartz X11"
  exit
  ;;
  3)
   SIZE="-m32"
  ;;
  6)
   SIZE="-m64"
  ;;
  c)
   CFLAGOPT="$OPTARG"
  ;;
  g)
   COMPILER="gcc"
   COMPILER2="g++"
  ;;
  i)
   COMPILER="icc"
   COMPILER2="icc"
  ;;
  q)
   QUARTZ="-I /opt/X11/include -Wno-unknown-pragmas"
  ;;
  t)
   SIZE=""
  ;;
esac
done
shift $(($OPTIND-1))
if [ "`uname`" == "Darwin" ]; then
  PLATFORM="-D pp_OSX"
fi
export COMPILER
export CFLAGOPT
export SIZE
export PLATFORM
export QUARTZ
