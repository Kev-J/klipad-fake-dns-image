# klipad-fake-dns-image
Docker image running a fake DNS to fix Klipad tablet's factory reset.

The manufacturer of Klipad tablets decided to use a cryptic website for testing whether the device is connected to internet or not...

## Prerequesite
* Docker (https://docs.docker.com/engine/install/ubuntu/)

## Directions
Open a terminal and execute the following commands:
1. <code>docker build -t bind .</code>
2. <code>docker run -d --rm --name=dns-server --net=host bind</code>
3. <code>docker exec -d dns-server named -c /var/bind/named.conf</code>
4. <code>host status.eqoe.cn localhost</code>

Should print
```
Using domain server:
Name: localhost
Address: ::1#53
Aliases:

status.eqoe.cn has address 216.58.204.110
```

5. Connect the Klipad to the same network as your host computer with the following advanced settings:
- IP parameters: Static
- IP address: Choose the one according to your network
- Gateway: according to your network
- DNS1: Address of the host running your bind9 docker image

6. Enjoy

## Credits
* https://medium.com/nagoya-foundation/running-a-dns-server-in-docker-61cc2003e899
* chacaltaya & Sigri from https://www.phonandroid.com/forum/threads/tablette-klipad-kl4888-bloquee-au-setupwizard-suite-a-recovery.203591/
