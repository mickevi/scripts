#!/usr/bin/ksh

PWDSAVE=$PWD
IFSSAVE=$IFS
IFS="
"
for C in $(find /home/shared/media -name "*.rar") ; do
    DIR="$(dirname $C)"
    cd "$DIR"
    echo "cd $DIR"
    FILE=$(basename $C)
    echo "checking for passwords.."
    RES=$(unrar l | egrep -i "password|\.r..$")
    if [[ $? -eq 0 ]] ; then
	echo "Password crap found in $C\n$RES" | mailx -s "unrar found crap in $C" mickevi
	mv $C $C.crap
	exit
    else
	echo "unrar e -y -inul $FILE"
	unrar e -y -inul "$FILE" 
	if [[ $? -eq 0 ]] ; then
	    echo "$DIR : rm -f *.r??" 
	    rm -f *.r??
	else
	    echo "Failed $C" | mailx -s "unrar failed $C" mickevi
	fi
    fi
    # Remove crap.
    rm -rf [sS]ample *.nfo *.svf
    
    cd $PWDSAVE
done
curl -s http://localhost:32400/library/sections/1/refresh 2>&1 >/dev/null
IFS=$IFSSAVE
