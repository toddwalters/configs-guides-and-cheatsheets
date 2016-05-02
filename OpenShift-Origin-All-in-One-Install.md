#### Origin All-in-One Install Instructions

There are two methods of doing the All-In-One install

[**Vagrant Based Install**](https://www.openshift.org/vm/)

1. Install virtual box
2. install vagrant
3. `vagrant init thesteve0/openshift-origin`
4. `vagrant up`

Log into Origin VM:    
`ssh -p 2222  -i .vagrant/machines/default/virtualbox/private_key vagrant@127.0.0.1`

Enable tunneling for hitting 172.x.x.x SDN for debugging:
`ssh -p 2222 -C -L 9999:127.0.0.1:8000 -i .vagrant/machines/default/virtualbox/private_key vagrant@127.0.0.1`

Console is at: [https://10.2.2.2:8443](https://10.2.2.2:8443)

#### Install cygwin
Install the Cygwin environment from cygwin.com to provide the ssh and rsync tools for use by Vagrant.

#### Install apt-cyg
Install apt-cyg from the apt-cyg page on github.com. Then you could install the required packages as follows: apt-cyg install rsync openssh

#### Install required packages
Install the required packages as follows: `apt-cyg install rsync openssh`


#### Translating Windows Paths and rsync
- One way to deal with this issue is to add the following lines to the per-user Vagrantfile in the `%USERPROFILE%\.vagrant.d\Vagrantfil`e file. *Note* that you will most likely need to create this file.
  ```
  # Cygwin Rsync under CMD.EXE Workaround
  ENV["VAGRANT_DETECTED_OS"] = ENV["VAGRANT_DETECTED_OS"].to_s + " cygwin"
  ```
- If you use Cygwin’s rsync under Windows cmd.exe, Vagrant is not able to tell that you are using Cygwin and supplies the wrong path to rsync. The workaround is to set the `VAGRANT_DETECTED_OS` variable to cygwin. For example:
  ```
  $ setx VAGRANT_DETECTED_OS cygwin
  ```
  To permanently set this variable for a bash shell, add the following line to the `.bashrc` file in the user’s home directory (`~/.bashrc`):
  ```
  export VAGRANT_DETECTED_OS=cygwin
  ```
- An alternative is to run Vagrant inside of Cygwin’s Terminal Window. This will provide a Linux-like experience with the Bash shell and a window that can be sized beyond 80 columns. In this way, you can use both Linux and Windows paths. However, to use Windows paths, you must surround thoses paths with single quotes. For example, `c:\User\joe` would be interpreted by the shell as `c:Userjoe` without single quotes. Surrounding `'c:\User\joe'` with single quotes, causes it to be interpreted correctly.
- 
