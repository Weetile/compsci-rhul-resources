
# Weetile's RHUL resources

Reminder -- you can access the **Table of Contents** to easily skip to a specific section!

![image](https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/b7dbfd71-d7a1-4a74-90fb-3e40ff8fa0e3)

If you learnt something new, please consider **tipping** at my Ko-fi!

[![Ko-Fi Tip Jar](https://i.imgur.com/5CmP1jo.png)](https://ko-fi.com/weetile)

## Linux CIM Tips and Tricks
### Creating an SSH alias  
You can easily create an SSH alias to make it **easier** and **more convenient** to connect to the Linux servers. 

👎😱 Normally, you'd authenticate to the Linux servers by specifying the username and host address: 

    ssh USERNAME@linux.cim.rhul.ac.uk
👍🌟    By creating an SSH alias, you can omit the username and host address as such: 

    ssh rhul
   To do this, you'll need to modify your ssh config. This can be found at `~/./ssh/config`.
   
   Make sure to **create the file if it doesn't exist**, then **append the following** to the file, replacing USERNAME with your RHUL username (e.g: ZLAT262 or similar)
```
Host rhul  
    User zlac218  
    HostName linux.cim.rhul.ac.uk
```
**That's it**! You can now  access the Linux server by just typing in `ssh rhul` ✨

Want to be able to login without typing in your password everytime? See the next section 😜

### Using SSH authentication for security and speed

![image](https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/15b130cd-bd55-470b-95e7-74b76a7bdd0d)


Using SSH public key authentication is more secure and more importantly -- means you don't have to type in your password everytime you authenticate to the CIM servers! 
To generate a new SSH keypair, you can run the following command on Linux:
`
ssh-keygen
`
Once you have your keypair saved, you can upload it to the Linux servers using the following command, replacing `USERNAME` with your username:

    ssh-copy-id USERNAME@linux.cim.rhul.ac.uk
You can confirm the SSH key has been added by authenticating to the server. If it doesn't ask you for your password, it's all set!
### Accessing Linux server off-campus in the evening

![image](https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/b953bf4b-b5ca-4655-bbd7-8f901ae5e31e)


The RHUL Linux machines **aren't able to be accessed off-campus in the evening** due to security reasons. To circumvent this, you can **connect to the RHUL VPN** by following [this guide](https://intranet.royalholloway.ac.uk/students/help-support/it-services/access-off-campus/vpn/vpn.aspx). The following information in this section is copied verbatim from that guide.  

- On **Linux**, download and install [this file](http://intranet.royalholloway.ac.uk/it/programs/pangplinux-5.2.4-c14.tgz) to connect to the VPN.

- On **Windows**, follow these instructions to download and install the VPN:

1.  Open your web browser and visit [https://student-vpn.royalholloway.ac.uk](https://student-vpn.royalholloway.ac.uk/). Please note that you must use 'royalholloway' and not 'rhul'
2.  Log in using your university username and password
3.  Download and open the installer for your operating system
4.  You will be guided through the process to install GlobalProtect. Leave all of the options as the default and complete the process with the installer wizard
5.  Once GlobalProtect has been installed open the app
6.  The app will ask you for a _Portal address._ Enter _student-vpn.royalholloway.ac.uk_ in the box and press _Connect_
7.  You will be prompted to log in. You will need to use your university email address (username@live.rhul.ac.uk format, e.g. abcd123@live.rhul.ac.uk) to access the university’s virtual private network (VPN). Enter these details, and press _Sign In_
8.  [Follow the instructions here to sign in with MFA.](https://intranet.royalholloway.ac.uk/students/help-support/it-services/multi-factor-authentication.aspx)

### Change resolution and display settings on NoMachine

    xfce4-display-settings
### Change default shell on the terminal
On most Linux systems including the CIM servers, `bash` is used as the default shell. Normally you'd use the `chsh` command to do this, however this is locked down by CIM for security reasons.
You can bypass this by modifying your `~/.profile` then relogging in. For example to change the default shell to `zsh`:
```
export SHELL=/bin/zsh  
exec /bin/zsh -l
```
### Adding new fonts on NoMachine
To add new fonts, for example for use on Visual Studio Code or Eclipse, you'll need to add the font (.ttf or .otf) to your `~/.local/share/fonts` directory. Then, run this command to refresh your font cache:
```
fc-cache -f -v
```
Restart the application and you should be good to go!
### Accessing the filesystem through Dolphin
The `fish` protocol allows you to access the filesystem of the Linux CIM server in Dolphin remotely. Navigate to this location in Dolphin, replacing USERNAME with your username (e.g: ZLAT262):
```
fish://USERNAME@linux.cim.rhul.ac.uk:22
```
You can add this as a remote directory in your Dolphin places panel by right clicking on Remote, pressing Add Entry and adding as such:

![image](https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/d939d76c-e4e0-48fd-a716-f9236ae99a9d)
## Command-line utilities
### gcc flags alias
In CS2850: Operating Systems, you are instructed to use the following flags when compiling C code using `gcc`:
```
-Wall -Werror -Wpedantic
```

- **-Wall**: This flag enables most of the commonly used warning messages. It stands for "all warnings." When you use this flag, the compiler will warn you about potential issues and non-standard code constructs. It helps you write more reliable and portable code by pointing out possible problems in your source code.

- **-Werror**: This flag treats all warning messages as errors. When you compile your code with this flag, any warning issued by the compiler will be treated as an error, and compilation will fail. Programmers often use this flag to ensure that the codebase remains free of warnings, making it easier to maintain and reducing the likelihood of hidden bugs.

- **-Wpedantic**: This flag generates warnings about code that doesn't follow the standard strictly. It helps in writing code that is more compliant with the language standard. It catches non-standard usages and enforces stricter adherence to the language specifications, ensuring better portability across different compilers and platforms.

To avoid having to type these out manually or copy-paste everytime, we can create an alias in our shell. For example we can define `rhulgcc` to include these flags automatically:

```
alias rhulgcc='gcc -Wall -Werror -Wpedantic'
```
If you enter this command, `rhulgcc` will be aliased until the shell has terminated. To make these changes persistent, we can modify the `~/.bashrc` file (or `~/.zshrc`) if applicable by appending that alias command to the bottom. Remember to restart the shell for these changes to take effect.

The `-o` flag allows you to specify the name of the output file, by default it will be `a.out`.

```
gcc filename.c -o outputfile
```

Note that these flags will also work for compiling C++ code using `g++`.

