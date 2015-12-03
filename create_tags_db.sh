#! /bin/sh

# Return on error
set -e

# List of root level directories we are interested in.
declare -a dirs=("product" "ao" "comp")
extensions="c|h|cpp|hpp|mk|e"

# Backup current working directory for later
cwd=`pwd`
rootdir=`pwd`
startfresh=0
includekernel=0

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

while getopts "h?ifd:" opt; do
    case "$opt" in
    h|\?) echo -e "
Usage: create_tags_db [-h] [-f] [-i] [-d <dir>]

-h          Print this help message
-f          Build fresh database instead of updating
-i          Include kernel sources
-d <dir>    Run on 'dir' instead of current working directory
        "
        exit 0
        ;;
    i)  includekernel=1
        ;;
    f)  startfresh=1
        ;;
    d)  rootdir=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))
[ "$1" = "--" ] && shift

echo "Running on - $rootdir"
cd $rootdir

if [ $startfresh == 1 ]; then
    echo 'Deleting existing cscope files...'
    rm -rfv cscope.*
    echo 'Deleting existing tags files...'
    rm -rfv tags*

    for dir in "${dirs[@]}"
    do
            echo "Finding files in: $rootdir/$dir"

            if [ $includekernel == 1 ]; then
                echo "Including kernel files too..."
                find ./$dir -type f -print | egrep -i "\.($extensions)$" >> $rootdir/cscope.files
            else
                # Don't include kernel and stub files
                find ./$dir -type f -and -not -iwholename "*/*kernel*/*" -and -not -iwholename "*stub*" -print | egrep -i "\.($extensions)$" >> $rootdir/cscope.files
            fi
    done
fi

echo 'Building cscope database...'
cscope -b -q -k

echo 'Building ctags database...'
ctags --extra=+f --c-kinds=+p --fields=+lS --excmd=p -L $rootdir/cscope.files

cd $cwd
echo 'All done.'
