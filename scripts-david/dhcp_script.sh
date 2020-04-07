#! /bin/bash

LOG_FILE=/var/log/dnsmasq.log
HOSTS_FILE=/etc/dnsmasq.d/dnsmasq_hosts.conf
NAME="odroid"

num_odroid() {
	num_odroids=$(cat $HOSTS_FILE | grep ^dhcp-host | wc -l)

	i=1
	while [[ $i -le $num_odroids ]] && [[ $(cat $HOSTS_FILE | grep "$NAME$i") ]]; do
			i=$(expr "$i" + 1)
	done

	echo $i
}

add_odroid() {
	if [[ ! $(cat $HOSTS_FILE | grep ^dhcp-host=$2) ]]; then
		num_line=$(num_odroid)
		if [[ "$num_line" -gt $(cat $HOSTS_FILE | wc -l) ]]; then
			echo "dhcp-host=$2,$NAME$(num_odroid),$3" >> $HOSTS_FILE
		else
			sed -i ''"$num_line"'i\dhcp-host='"$2"','"$NAME"''"$num_line"','"$3"'' $HOSTS_FILE
		fi
	fi
}

delete_odroid() {
	systemctl stop dnsmasq
	sed -i '/'"$2"'/d' /var/lib/misc/dnsmasq.leases
	#sed '/^$/d' /var/lib/misc/dnsmasq.leases # Esborra linies buides
	sed -i '/'"$2"'/d' $HOSTS_FILE
	#sed '/^$/d' $HOSTS_FILE # Esborra linies buides
	systemctl start dnsmasq
}

save_log() {
	echo $(date) >> $LOG_FILE
	echo $@ >> $LOG_FILE
	echo >> $LOG_FILE
}

if [[ ! -f $HOSTS_FILE ]]; then
	touch $HOSTS_FILE
fi

save_log $@

case "$1" in

	add)
		add_odroid $@
		systemctl restart dnsmasq
	;;

	old)
		# Si no esta al fitxer de hosts l'afegim
		if [[ ! $(grep "$2" $HOSTS_FILE) ]]; then
			add_odroid $@
			systemctl restart dnsmasq
		#else
			# Si esta al fitxer de hosts pero no te la ip correcta
			#if [[ $(grep "$2" $HOSTS_FILE | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') != $3 ]]; then
			#	sed -i '/'"$2"'/d' $HOSTS_FILE
			#	add_odroid $@
			#	systemctl restart dnsmasq
			#fi

		fi
	;;

	del)
		#delete_odroid $@
	;;

	-h|--help)
		echo "Dnsmasq sends the following parameters in this order:
	\$1 = Action to take, which can be: add, old, del
	\$2 = MAC address
	\$3 = IP address
	\$4 = Name assigned

Of the above, this script only uses the first 3, to assign
the IPs to the hosts statically and give them a name."
	;;
	*)
		echo "Incorrect option" 1>&2
		exit 1
	;;
esac
