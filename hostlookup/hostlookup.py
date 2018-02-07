import socket
with open('hostlist.txt') as f:
    for line in f:
        try:
            addr = socket.gethostbyname(line.strip())
            print(line.strip() + ", " + addr)
        except socket.error as e:
            print(line.strip() + ", " + str(e))
