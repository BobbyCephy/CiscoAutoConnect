# CiscoAutoConnect
Windows scripts for automatic connection to the University of Bayreuth network via VPN using Cisco Secure Client.

## Installation
- Open: https://vpn-server.uni-bayreuth.de
- Log in with GROUP: `Outside-AC`, USERNAME: `bt******` and PASSWORD
- Download and install Cisco Secure Client
- Start Cisco Secure Client and connect once to `vpn-server.uni-bayreuth.de`

## Configuration
Open Command Prompt as administrator to save your credentials:
```bat
setx BT_USERNAME /M "your-username"
setx BT_PASSWORD /M "your-password"
```

## Usage
Connect:
```bat
connect.bat
```

Disconnect:
```bat
disconnect.bat
```