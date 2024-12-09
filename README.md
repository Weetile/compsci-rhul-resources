# Weetile's RHUL resources

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="[https://github.com/othneildrew/Best-README-Template](https://github.com/Weetile/weetile-compsci-rhul-resources)">
    <img src="https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/1a4bbada-60c3-47f8-8fd7-ac4bd1517cdd">
  </a>

  <h3 align="center">Weetile's Computer Science RHUL Resources</h3>

  <p align="center">
    Some tips and tricks to make your degree just a bit easier! ✨<br />
    Contact me to add any suggestions: <a href="mailto:otto.hg@outlook.com">otto.hg@outlook.com</a>
  </p>
</div>

---

Reminder -- you can access the **Table of Contents** to easily skip to a specific section!

If you learnt something new, please consider **tipping** at my Ko-fi!

[![Ko-Fi Tip Jar](https://i.imgur.com/5CmP1jo.png)](https://ko-fi.com/weetile)

## Royal Holloway Quick Links
- [Campus Connect](https://campus-connect.royalholloway.ac.uk/) 💡
- [Moodle](https://moodle.royalholloway.ac.uk/) 📚
- [Mail](https://outlook.office365.com/mail/) 📧
- [Timetable](https://webtimetables.royalholloway.ac.uk/SWS/SDB2324SWS/default.aspx) 📅 
- [Attendance](https://generalssb-prod.ec.royalholloway.ac.uk/BannerExtensibility/customPage/page/RHUL_Attendance_Student) ⏱️
- [Piazza](https://piazza.com/) 📰
- [CIM GitLab Server](https://gitlab.cim.rhul.ac.uk/) 🖥️
## Linux CIM Tips and Tricks
### Creating an SSH alias  
You can easily create an SSH alias to make it **easier** and **more convenient** to connect to the Linux servers. 

👎😱 Normally, you'd authenticate to the Linux servers by specifying the username and host address: 

    ssh USERNAME@linux.cim.rhul.ac.uk
👍🌟    By creating an SSH alias, you can omit the username and host address as such: 

    ssh rhul
   To do this, you'll need to modify your ssh config. This can be found at `~/.ssh/config`.
   
   Make sure to **create the file if it doesn't exist**, then **append the following** to the file, replacing USERNAME with your RHUL username (e.g: ZLAT262 or similar)
```
Host rhul  
    User zabc123  
    HostName linux.cim.rhul.ac.uk
    # Uncomment the bottom two lines to set a custom shell
    #RequestTTY force
    #RemoteCommand /bin/zsh
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
### Setting up Royal Holloway VPN (allowing access to Linux server off-campus in the evening)

![image](https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/b953bf4b-b5ca-4655-bbd7-8f901ae5e31e)


The RHUL Linux machines **aren't able to be accessed off-campus in the evening** due to security reasons. To circumvent this, you can **connect to the RHUL VPN** by following [this guide](https://intranet.royalholloway.ac.uk/students/help-support/it-services/access-off-campus/vpn/vpn.aspx). This allows off-campus users to routing your network traffic through the campus, giving you a Royal Holloway network address, behaving exactly like it would if you were on campus and this allowing you quick access to restricted services, like library services, your Y: drive and evening access to the Linux servers.  

- On **Linux**, Royal Holloway officially recommends using the GlobalProtect app on Linux to connect to their VPN, found on [this page](https://intranet.royalholloway.ac.uk/students/help-support/it-services/access-off-campus/vpn/vpn.aspx).

  **That being said,** I would strongly encourage using the free and open source utility [GlobalProtect-openconnect](https://github.com/yuezk/GlobalProtect-openconnect) to connect instead. It is avaliable as an official package on all major Linux distributions, maintains a persistent installation and is more convenient as it provides a graphical user interface.

![image](https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/7a299138-02b5-428a-85a5-859285fa0bb7)

  For Ubuntu and Mint, the installation instructions are as such:
```
sudo add-apt-repository ppa:yuezk/globalprotect-openconnect
sudo apt-get update
sudo apt-get install globalprotect-openconnect
```
For Arch Linux, simply install:
```
sudo pacman -Sy globalprotect-openconnect
```

After installed, run `gpclient` to start the UI then enter `staff-vpn.royalholloway.ac.uk` as the portal address.
  

- On **Windows**, follow these instructions to download and install the VPN:

1.  Open your web browser and visit [https://student-vpn.royalholloway.ac.uk](https://student-vpn.royalholloway.ac.uk/). Please note that you must use 'royalholloway' and not 'rhul'
2.  Log in using your university username and password
3.  Download and open the installer for your operating system
4.  You will be guided through the process to install GlobalProtect. Leave all of the options as the default and complete the process with the installer wizard
5.  Once GlobalProtect has been installed open the app
6.  The app will ask you for a _Portal address._ Enter _staff-vpn.royalholloway.ac.uk_ in the box and press _Connect_
7.  You will be prompted to log in. You will need to use your university email address (username@live.rhul.ac.uk format, e.g. abcd123@live.rhul.ac.uk) to access the university’s virtual private network (VPN). Enter these details, and press _Sign In_
8.  [Follow the instructions here to sign in with MFA.](https://intranet.royalholloway.ac.uk/students/help-support/it-services/multi-factor-authentication.aspx)

### Basic Linux Commands

These are some basic Linux commands that are helpful to know.
- `ls` (list) is used to list the contents of the current directory (folder)
- `mkdir` (make directory) is used to create directories.
    - e.g: `mkdir movies` will create a new directory `movies`
- `cd` (change directory) is used to change the directory you are working in.
- `pwd` (print working directory) will print the path of the current directory
    - e.g: Output: `/home/cim/ug/username`
- `mv` (move) is used to move files and folders between different directories.
    - e.g: `mv shrek2.txt movies/` will move `shrek2.txt` into the directory `movies`
- `rm` (remove) is used to delete files.
    - e.g: `rm shrek2.txt` will remove the file `shrek2.txt`.

### Editing files and writing code through the terminal

To edit files through the terminal, you can use `nano`.
By typing `nano main.py`, a new file with name `main.py` is created, and you can instantly start typing or editing code by navigating using arrow keys.
Your changes won't be saved until you input `Ctrl+O` (write out/save) and hit enter, and you can use `Ctrl+X` (quit) to exit the program.

To run your Python file after this, simply type `python3 main.py` and your code will output to the terminal.

Alternatively, you can learn `vim` for a lot more power and efficiency, but there is a difficulty curve. You can access the 30 minute built-in Vim tutorial by typing in `vimtutor`.

### Change resolution and display settings on NoMachine

    xfce4-display-settings
### Adding new fonts on NoMachine
To add new fonts, for example for use on Visual Studio Code or Eclipse, you'll need to add the font (.ttf or .otf) to your `~/.local/share/fonts` directory. You can use the `fc-cache` command to scan the font directories on the system and build font information cache files for applications using `fontconfig` for their font handling. Thus, run this command:
```
fc-cache -fv
```
Restart the application and you should be good to go!
### Accessing the filesystem through Dolphin
The `fish` protocol allows you to access the filesystem of the Linux CIM server in Dolphin remotely. Navigate to this location in Dolphin, replacing USERNAME with your username (e.g: ZLAT262):
```
fish://USERNAME@linux.cim.rhul.ac.uk:22
```
You can add this as a remote directory in your Dolphin places panel by right clicking on Remote, pressing Add Entry and adding as such:

![image](https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/d939d76c-e4e0-48fd-a716-f9236ae99a9d)

### Installing Neovim on the Linux CIM Servers

#### One-command install
```
curl -sSL https://gist.github.com/Weetile/d208d9acae823ede5f2188a2695b3197/raw | sh
```

## Command-line utilities
### gcc flags alias

![gccflags](https://github.com/Weetile/weetile-compsci-rhul-resources/assets/7700383/7e6df802-9bf2-4da6-9b77-d29690257780)


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
