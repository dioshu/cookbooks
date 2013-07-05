case node['platform']
when "debian","ubuntu"
  default['networking']['packages'] = %w[ vim nload ngrep nmap vim vim-runtime perl mysql-server hping3 sysstat axel apache2 gawk net-tools mtr gcc g++ make build-essential vsftpd ntpdate tzdata make samba php5 git ssh expect tcpdump ethtool fping snmpd cpio elinks php5-mysql pptpd ppp freeradius freeradius-mysql ldap-utils slapd python-ldap ldapscripts cvs subversion subversion-tools screen lsof iptables jwhois whois curl wget rsync jnettop nmap traceroute ethtool iproute iputils-ping netcat-openbsd tcptraceroute tcputils tcpdump elinks lynx  php5-mysql pptpd ppp freeradius freeradius-mysql ldap-utils slapd python-ldap ldapscripts cvs subversion subversion-tools screen curl sudo zip unzip ]
when "redhat","centos","scientific","amazon"
  default['networking']['packages'] = %w[ lsof iptables jwhois curl wget rsync nmap traceroute ethtool iproute iputils nc tcptraceroute tcputils tcpdump elinks lynx ]
end
