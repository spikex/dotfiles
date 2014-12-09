alias j=jobs
alias pd=pushd
alias subj='subj -n'

if [ -z "$SSH_CONNECTION" ]; then
   case $OSTYPE in
   darwin*)
       export EMACSCLIENT=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
       alias emacsclient=$EMACSCLIENT
       ;;
   *)
       export EMACSCLIENT=emacsclient
       ;;
   esac
   alias ec="$EMACSCLIENT -c -n"
   export EDITOR="$EMACSCLIENT -c"
   export ALTERNATE_EDITOR=""
else
    export EDITOR=$(type -P emacs || type -P vim || type -P vi)
fi
export VISUAL=$EDITOR

# See stuff-things.net/2014/10/14/ban-bad-bots-by-ip
top-ips() { awk '{print $1 }' $@ | sort | uniq -c | sort -nr | head -20; }
ban-ip() { /sbin/route add -host $@ reject; }
bsd-ban-ip() { /sbin/route add $@ 127.0.0.1 -blackhole; }
