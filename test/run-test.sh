# Author : Barun Halder
# ID : bhalder
# Date : 02.10.2016
# Bash script to run test for individual project

#! /bin/sh

############## IN CASE OF FAILURE #################
#
# Increase the limit of the descriptors
# sudo sh -c "ulimit -n 65535 && exec su $LOGNAME"
#
###################################################



# Modify these parameters 

########### GENERAL SECTION ################################
BATCH_NAME_BASELINE=baseline
CLIENTS_NUM_MAX=100
CLIENTS_NUM_START=10
CLIENTS_RAMPUP_INC=200
INTERFACE=eth0
NETMASK=16
IP_ADDR_MIN=192.168.1.1
IP_ADDR_MAX=192.168.1.4
IP_SHARED_NUM=4
CYCLES_NUM=-1
URLS_NUM=1

####################

PORT=8080

########### URL SECTION ####################################

URL=http://127.0.0.1:$PORT/cgi-bin/adder
URL_SHORT_NAME="local-index"
REQUEST_TYPE=GET
TIMER_URL_COMPLETION=0      # In msec. When positive, Now it is enforced by cancelling url fetch on timeout
TIMER_AFTER_URL_SLEEP=10000

########### CREATE THE CONF FILES ##########################
echo "Creating conf files"
rm baseline.conf modified.conf

echo "BATCH_NAME=$BATCH_NAME_BASELINE" >> baseline.conf
echo "CLIENTS_NUM_MAX=$CLIENTS_NUM_MAX" >> baseline.conf
echo "CLIENTS_NUM_START=$CLIENTS_NUM_START" >> baseline.conf
echo "CLIENTS_RAMPUP_INC=$CLIENTS_RAMPUP_INC" >> baseline.conf
echo "INTERFACE=$INTERFACE" >> baseline.conf
echo "NETMASK=$NETMASK" >> baseline.conf
echo "IP_ADDR_MIN=$IP_ADDR_MIN" >> baseline.conf
echo "IP_ADDR_MAX=$IP_ADDR_MAX" >> baseline.conf
echo "IP_SHARED_NUM=$IP_SHARED_NUM" >> baseline.conf
echo "CYCLES_NUM=$CYCLES_NUM" >> baseline.conf
echo "URLS_NUM=$URLS_NUM" >> baseline.conf
echo "URL=$URL" >> baseline.conf
echo "URL_SHORT_NAME=$URL_SHORT_NAME" >> baseline.conf
echo "REQUEST_TYPE=$REQUEST_TYPE" >> baseline.conf
echo "TIMER_URL_COMPLETION=$TIMER_URL_COMPLETION" >> baseline.conf
echo "TIMER_AFTER_URL_SLEEP=$TIMER_AFTER_URL_SLEEP" >> baseline.conf


###### Creating the modified conf #########
echo "BATCH_NAME=$BATCH_NAME" >> modified.conf
echo "CLIENTS_NUM_MAX=$CLIENTS_NUM_MAX" >> modified.conf
echo "CLIENTS_NUM_START=$CLIENTS_NUM_START" >> modified.conf
echo "CLIENTS_RAMPUP_INC=$CLIENTS_RAMPUP_INC" >> modified.conf
echo "INTERFACE=$INTERFACE" >> modified.conf
echo "NETMASK=$NETMASK" >> modified.conf
echo "IP_ADDR_MIN=$IP_ADDR_MIN" >> modified.conf
echo "IP_ADDR_MAX=$IP_ADDR_MAX" >> modified.conf
echo "IP_SHARED_NUM=$IP_SHARED_NUM" >> modified.conf
echo "CYCLES_NUM=$CYCLES_NUM" >> modified.conf
echo "URLS_NUM=$URLS_NUM" >> modified.conf
echo "URL=$URL" >> modified.conf
echo "URL_SHORT_NAME=$URL_SHORT_NAME" >> modified.conf
echo "REQUEST_TYPE=$REQUEST_TYPE" >> modified.conf
echo "TIMER_URL_COMPLETION=$TIMER_URL_COMPLETION" >> modified.conf
echo "TIMER_AFTER_URL_SLEEP=$TIMER_AFTER_URL_SLEEP" >> modified.conf

echo "Conf files created"

# Run Tests
exec `../curl-loader/curl-loader -f baseline.conf`
sleep(10)
echo "Test Complete."
