import ipaddress
import subprocess

net = ipaddress.ip_network('172.20.8.0/24')
hosts =[]
for host in net.hosts():
    hosts.append(str(host))
hosts = ' '.join(hosts)

results = subprocess.getoutput('fping ' + hosts)

print(results)
with open('pinger_results.txt', 'w') as f:
    f.write(results)
