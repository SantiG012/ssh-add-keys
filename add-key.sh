getAllPrivateKeys(){
    find ~/.ssh -type f ! -name "*.pub"
}


isValidKey(){
    [ -n "$key" ]
}

selectPrivateKey() {
    while true; do
        PS3="Select a private key (Is waiting for a valid input): "
        select key in $(getAllPrivateKeys); do
            if isValidKey; then
                echo $key
                return
            fi
        done
    done
}


addKey(){
    ssh-add $(selectPrivateKey)
}

addKey