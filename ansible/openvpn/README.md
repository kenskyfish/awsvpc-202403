This installs openvpn so clients can connect using OpenVPN client via HTTPS

You have to make an AWS Ubuntu 22 instance first, then put the public IP in hosts and execute.

script makecreds.sh is used to generate keys/config for end users, tgz file dropped in /home/ubuntu/

You need at least 1 GiB RAM to do the ansible installation. After that can reduce.