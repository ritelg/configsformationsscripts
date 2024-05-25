set -x EDITOR nvim
abbr docker_ps_format "docker ps -a --format 'table {{ .ID }}\t{{ .State }}\t{{ .Names }}\t{{ .Ports }}'"
alias connectTryHackMe="sudo openvpn /home/ritelg/Cybersecurity/Tryhackme/config_files/CyberWhisperer.ovpn"

abbr a "arsenal"

set -x PATH $PATH /home/ritelg/.local/bin
