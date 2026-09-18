# CiscoAutoConnect
Windows scripts for automatic connection to the University of Bayreuth network via VPN with Cisco Secure Client

Open an Administrator Command Prompt to save your credentials:
```bat
setx BT_USERNAME /M "your-username"
setx BT_PASSWORD /M "your-password"
```

Connect:
```bat
connect.bat
```

Disconnect:
```bat
disconnect.bat
```