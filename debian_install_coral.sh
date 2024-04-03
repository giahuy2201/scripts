mkdir -p -m 755 /etc/apt/keyrings &&
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /etc/apt/keyrings/google-cloud.gpg &&
    chmod a+r /etc/apt/keyrings/google-cloud.gpg &&
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-cloud.gpg] https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list &&
    apt update &&
    apt install -y libedgetpu1-std gasket-dkms
