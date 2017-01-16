# The script checks host accessibility with "ping" command, if no arguments have been passed, 
# and output the result in format: "IP address : OK" or "Failed".
# If a parameter has been passed then ssh connection is opened for the address provided by the parameter.

ip1=192.168.100.19
ip2=192.168.102.38
ip3=127.0.0.1
ip4=192.168.100.2
if [ $# -eq 0 ]; then
        for i in $ip1 $ip2 $ip3 $ip4
        do
                if [ `ping -c 1 $i > /dev/null ; echo $?` -eq 0 ] ; then
                        echo $i : OK
                else
                        echo $i : Failed
                fi
        done
else
        if [ $# -eq 1 ]; then
                ssh  $1
        fi
fi
