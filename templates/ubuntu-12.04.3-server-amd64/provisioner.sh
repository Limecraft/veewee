date > /etc/vagrant_box_build_time

# Setup sudo to allow no-password sudo for "sudo"
useradd -s /bin/bash -m -G sudo provisioner

usermod -a -G sudo provisioner

# Installing vagrant keys
mkdir /home/provisioner/.ssh
chmod 700 /home/provisioner/.ssh
cd /home/provisioner/.ssh
wget --no-check-certificate 'http://boreas.limecraft.com/id_rsa.pub' -O authorized_keys
chmod 600 /home/provisioner/.ssh/authorized_keys
chown -R provisioner /home/provisioner/.ssh

echo 'provisioner ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/provisioner
echo 'Defaults    env_keep += "SSH_AUTH_SOCK"' >> /etc/sudoers.d/provisioner