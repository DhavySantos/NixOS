# INPUT Chain Rules
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 5/sec -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# FORWARD Chain Rules
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i tun0 -d 172.18.0.0/16 -j ACCEPT
sudo iptables -A FORWARD -i docker1 -d 172.18.0.0/16 -j ACCEPT
sudo iptables -A FORWARD -i docker1 -o eth0 -j ACCEPT

# NAT Table Rules
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
