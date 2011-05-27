Murtan
======

Bringing the elegance of PF to horrific kludge that is iptables

Filter rules
------------

`pass in on eth0 proto tcp from 192.168.1.0/24 to 192.168.0.1 port 22 keep
state`
`block out on eth1 proto tcp from 192.168.0.0/24 to any`

