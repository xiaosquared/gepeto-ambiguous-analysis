LOCATION=$1

for file in ${LOCATION}/*.gest; do

    # Remove the directory name
    file1="${file##*/}"
    # Remove the extension
    file1="${file1%.*}"
    echo "${file1}"

    # Separate by -
    order="$(cut -d'-' -f1 <<< $file1)"
    phrase="$(cut -d'-' -f3 <<< $file1)"
    subject="$(cut -d'-' -f4 <<< $file1)"
    condition="$(cut -d'-' -f2 <<< $file1)"

    #if [[ -z "${condition// }" ]]; then
    #  condition="imitation"
    #fi

    newname="${subject}-${condition}-${phrase}-${order}.gest"
    echo ${LOCATION}/${newname}

    mv "${LOCATION}/$file1.gest" ${LOCATION}/${newname}


    done
