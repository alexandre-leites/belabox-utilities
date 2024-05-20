# BELABOX UTILITIES

### **Rooting BELABOX**
- Description: Enable installing and modifying software on BELABOX.
- Type: How-To
- Link: [Rooting BELABOX](./docs/root.md)



### **Enable WS/WSS in BELABOX front-end**
- Description: Currently, BELABOX have the websocket communication between the interface and the backend hardcoded with non-secure websockets. This patch allow the front-end connect with WSS (Secure WebSockets) if it is needed, allowing for BELABOX access behind a secure HTTPS connection.
- Type: Patch
- Commands:
```bash
curl -L --output enable-wss.patch https://raw.githubusercontent.com/alexandre-leites/belabox-utilities/main/patches/enable-wss.patch
patch -p1 -d /opt/belaUI/ < enable-wss.patch
```



### **Enable 30mbps bitrate in BELABOX**
- Description: Currently, BELABOX limits the bitrate to 12mbps, which is fair and enough for most people. However, we can push it to 30mbps without the need of recompiling any libraries.
- Type: Patch
- Commands:
```bash
curl -L --output enable-30mbps.patch https://raw.githubusercontent.com/alexandre-leites/belabox-utilities/main/patches/enable-30mbps.patch
patch -p1 -d /opt/belaUI/ < enable-30mbps.patch
```


