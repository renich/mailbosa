#!/usr/bin/env bash

# check if ran by root
if [ $( id -u ) != "0" ]; then
    echo 'Sorry; must be ran by root'
    exit 1
fi

userdel -fr mailbosa &> /dev/null

rm -f /usr/local/bin/mailbosa
rm -fr /usr/local/share/doc/mailbosa
rm -fr /usr/local/share/mailbosa
rm -fr /var/lib/mailbosa
rm -fr /var/log/mailbosa

exit 0

