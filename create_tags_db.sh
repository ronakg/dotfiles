#! /bin/bash

# Exit the script on any error
set -e

# List of root level directories we are interested in.
declare -a dirs=()
filetypes="\.c|\.h|\.cpp|\.hpp|\.mk|\.e|Makefile|\.sh|\.xml|\.py"

# Backup current working directory for later
cwd=`pwd`
rootdir=`pwd`
startfresh=0
includekernel=0

usage() {
    echo -e "
Usage: create_tags_db [-i] [-s source] [-f | -d d1,d2,d3,...] [-h]

-i            Include kernel sources
-s source     Run on 'source' directory instead of current working directory
-d d1,d2,...  Comma separated list of top level directory to parse for cscope database
-h            Print this help message

Existing cscope.files is used to generate the database unless -d option is passed. In which case, fresh cscope.files file is generated.
"
}

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

while getopts ":is:fd:h" opt; do
    case "${opt}" in
    h)
        usage
        exit 0
        ;;
    i)
        includekernel=1
        ;;
    s)
        rootdir=${OPTARG}
        ;;
    d)
        set -f          # disable glob
        IFS=','         # split on comma character
        dirs=(${OPTARG})
        startfresh=1
        set +f
        ;;
    \?)
        echo "Invalid option: -${OPTARG}"
        usage
        exit 1
        ;;
    :)
        echo "Option '-${OPTARG}' requires an argument."
        usage
        exit 1
        ;;
    *)
        echo "Invalid option - ${OPTARG}"
        usage
        exit1
        ;;
    esac
done

shift $((OPTIND-1))
[ "${1}" = "--" ] && shift

echo "Running on - "${rootdir}""
cd "${rootdir}"

# Build fresh database if -f is present or -d is present
if [ ${startfresh} -eq 1 ] || [ ${#dirs[@]} -gt 0 ]; then
    echo 'Deleting existing cscope files...'
    rm -rfv ./cscope.*
    if [ ${#dirs[@]} -lt 1 ]; then
        declare -a dirs=("./")
    fi

    for dir in "${dirs[@]}"
    do
        echo "Finding files in: "${rootdir}"/${dir}"

        if [ ${includekernel} -eq 1 ]; then
            echo "Including kernel files too..."
            find ${dir} -type f -print | egrep -i "(${filetypes})$" >> "${rootdir}"/cscope.files
        else
            # Don't include kernel and stub files
            find ${dir} -type f -and -not -iwholename "*/*kernel*/*" -and -not -iwholename "*stub*" -print | egrep -i "(${filetypes})$" >> "${rootdir}"/cscope.files
        fi
    done
else
    if [ ! -e "${rootdir}"/cscope.files ]; then
        echo "cscope.files not found in "${rootdir}""
        usage
        exit 1
    else
        echo "Reusing ${rootdir}/cscope.files as list of files..."
    fi
fi

echo 'Building cscope database...'
cscope -b -q -k -i "${rootdir}"/cscope.files

cd "${cwd}"
echo 'All done'
