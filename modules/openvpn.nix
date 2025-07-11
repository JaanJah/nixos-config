{
  # https://wiki.nixos.org/wiki/OpenVPN
  services.openvpn.servers = {
    # https://my.cyberghostvpn.com/products-vpn/manage-devices
    # sudo systemctl start openvpn-cyberghost-sweden.service
    # systemctl status openvpn-cyberghost-sweden.service
    # sudo systemctl stop openvpn-cyberghost-sweden.service
    cyberghost-sweden = {
      config = ''config /etc/nixos/openvpn/cyberghost-sweden/openvpn.ovpn '';
      autoStart = false;
    };
  };
}
