#!/usr/bin/env bash

# check if ran by root
if [ $( id -u ) != "0" ]; then
    echo 'Sorry; must be ran by root'
    exit 1
fi

prefix=$( readlink -f $( dirname $0 )/.. )
INSTALL="install -p"

## functions
function user-remove
{
    # delete user
    if $( id mailbosa &> /dev/null ); then
        userdel -fr mailbosa &> /dev/null
    fi
}

function user-add
{
    useradd -r -d /var/lib/mailbosa -s /usr/sbin/nologin -Z system_u mailbosa
    $INSTALL -d -m 2770 -o mailbosa -g mailbosa /var/lib/mailbosa
}

# add user (recreate if already exists)
echo 'removing user if any...'
user-remove

echo 'adding user...'
user-add

# create directories
for d in /var/lib/mailbosa /var/log/mailbosa; do
    $INSTALL -d -m 2770 -o mailbosa -g mailbosa $d
done

# install configuraiton
echo 'installing configuration files...'
$INSTALL -d -m 2750 -o root -g mailbosa /usr/local/etc/mailbosa
$INSTALL -m 640 -o root -g mailbosa ${prefix}/usr/local/etc/mailbosa/* /usr/local/etc/mailbosa/

# install libraries
echo 'installing libraries...'
$INSTALL -d -m 755 -o root -g mailbosa /usr/local/share/mailbosa
$INSTALL -m 444 -o root -g mailbosa ${prefix}/usr/local/share/mailbosa/* /usr/local/share/mailbosa

# install binary
echo 'installing binary...'
$INSTALL -m 755 -o root -g root ${prefix}/usr/local/bin/mailbosa /usr/local/bin/mailbosa
	
# install empty log
$INSTALL -m 640 -o mailbosa -g mailbosa ${prefix}/var/log/mailbosa/main.log /var/log/mailbosa/main.log

exit 0
