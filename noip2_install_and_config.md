# Installation of no-ip client and configuring it to start on system boot.

0. `su`
1. `cd /usr/local/src`
2. `wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz`
3. `tar xzf noip-duc-linux.tar.gz`
4. `cd noip-2.1.9-1/`
5. `make` it may show some warnings but the installation will complete anyway.
6. `make install` fill in the configuration for the client.
7. Kill the running no noip2 service, you can find the id with  `ps -A | grep noip2`
8. `touch /etc/systemd/system/noip2.service`
9. Add this to the file `/etc/systemd/system/noip2.service`:

"
[Unit]
Description=DynDNS by NoIP

[Service]
Type=forking
ExecStart=/usr/local/bin/noip2

[Install]
WantedBy=multi-user.target
"

10. Enable at boot `systemctl enable noip2.service`
11. Start the service `systemctl start noip2.service`
12. Check that everything is fine with: `systemctl status noip2.service`
