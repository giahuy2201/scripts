mkdir -p -m 755 /etc/apt/keyrings &&
    wget -qO - https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /etc/apt/keyrings/google-cloud.gpg &&
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-cloud.gpg] https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list &&
    apt update &&
    apt install -y libedgetpu1-std git devscripts dh-dkms &&
    git clone https://github.com/google/gasket-driver.git $HOME/gasket-driver &&
    cd $HOME/gasket-driver &&
    git pull &&
    debuild -us -uc -tc -b &&
    cd .. &&
    dpkg -i gasket-dkms_*.deb &&
    apt remove devscripts dh-dkms
    apt update && apt upgrade
