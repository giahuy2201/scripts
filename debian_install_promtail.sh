cd $HOME &&
    apt update &&
    apt install wget curl -y &&
    curl -s https://api.github.com/repos/grafana/loki/releases/latest |
    grep "promtail_*_amd64.deb" |
        cut -d : -f 2,3 |
        tr -d \" |
        wget -qi - &&
    dpkg -i promtail_*_amd64.deb
