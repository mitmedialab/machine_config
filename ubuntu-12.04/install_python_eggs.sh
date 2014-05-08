

if [ "$(id -u)" != "0" ]
then
    echo ""
    echo "run as root. eg. sudo ./update.sh"
    exit 1
fi

PROG_PATH=$(dirname $0)
EGG_PATH=${PROG_PATH}/third_party/python_eggs

easy_install ${EGG_PATH}/six-1.6.1-py2.7.egg
easy_install ${EGG_PATH}/Cython-0.20.1-py2.7-linux-x86_64.egg
easy_install ${EGG_PATH}/scikit_image-0.10dev-py2.7-linux-x86_64.egg

