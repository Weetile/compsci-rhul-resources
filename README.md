# Weetile's RHUL resources
## Linux CIM
### SSH Alias
You can easily create an SSH alias to make it **easier** and **more convenient** to connect to the Linux servers. 
👎 Normally, you'd authenticate to the Linux servers as such: 

    ssh USERNAME@linux.cim.rhul.ac.uk
👍🌟    By creating an SSH alias, all you have to type in is this: 

    ssh rhul
   To do this, you'll need to modify your ssh config. (`~/./ssh/config`)  Make sure to create it doesn't exist, then append the following to the file, replacing USERNAME with your RHUL username (e.g: ZLAT262 or similar)
```
Host rhul  
    User zlac218  
    HostName linux.cim.rhul.ac.uk
```
That's it! You can now  access the Linux server by just typing in `ssh rhul` ✨
Want to be able to login without typing in your password everytime? See the next section 😜

### SSH Authentication
Using SSH public key authentication is more secure and more importantly -- means you don't have to type in your password everytime you authenticate to the CIM servers! 
To generate a new SSH keypair, you can run the following command on Linux:
`
ssh-keygen
`
Once you have your keypair saved, you can upload it to the Linux servers using the following command, replacing `USERNAME` with your username:

    ssh-copy-id USERNAME@linux.cim.rhul.ac.uk
You can confirm the SSH key has been added by authenticating to the server. If it doesn't ask you for your password, it's all set!
### Accessing Linux server off-campus in the evening
The RHUL Linux machines aren't able to be accessed off-campus in the evening due to security reasons. To circumvent this, you can connect to the RHUL VPN by following [this guide](https://intranet.royalholloway.ac.uk/students/help-support/it-services/access-off-campus/vpn/vpn.aspx).
