#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/s2/Desktop/RoboCupap2018RVRL_Demo/src/victim175"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/s2/Desktop/RoboCupap2018RVRL_Demo/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/s2/Desktop/RoboCupap2018RVRL_Demo/install/lib/python2.7/dist-packages:/home/s2/Desktop/RoboCupap2018RVRL_Demo/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/s2/Desktop/RoboCupap2018RVRL_Demo/build" \
    "/usr/bin/python" \
    "/home/s2/Desktop/RoboCupap2018RVRL_Demo/src/victim175/setup.py" \
    build --build-base "/home/s2/Desktop/RoboCupap2018RVRL_Demo/build/victim175" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/s2/Desktop/RoboCupap2018RVRL_Demo/install" --install-scripts="/home/s2/Desktop/RoboCupap2018RVRL_Demo/install/bin"
