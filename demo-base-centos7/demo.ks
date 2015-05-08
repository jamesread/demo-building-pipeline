cdrom
install
reboot
rootpw password
lang en_GB.UTF8
firewall --service ssh
network --onboot yes --bootproto dhcp --ipv6 off
timezone Europe/London
selinux --enforcing
skipx
text
clearpart --all
zerombr
part /boot --size 1024
part swap --recommended
part pv.1 --size 1024 --grow
volgroup vg_root pv.1
logvol / --fstype=ext4 --size 1024 --grow --name lv_root --vgname vg_root
bootloader --location=mbr --timeout 10

%packages
vim-enhanced
git
wget
ruby
htop
%end

%post
wget http://www.jwread.com/var/nix/profile.txt -O /root/.bashrc
%end

%post 
rpm -U http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
yum install puppet -y 
%end

