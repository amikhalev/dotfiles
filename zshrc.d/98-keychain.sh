# Starts the keychain and prompts for keychain password if keychain is available

command -v keychain 1>/dev/null && eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
