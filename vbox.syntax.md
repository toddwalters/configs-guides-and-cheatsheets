#### VBoxManage Man page
- [VBoxManage Manual link](https://www.virtualbox.org/manual/ch08.html)

#### Get a List of VirtualBox VMs
- List of all VM's: ``` VBoxManage list vms ```
- List of all "running" VM's: ``` VBoxManage list runningvms ```
- List virtual machines and their corresponding states execute command:
```
$ VBoxManage list vms -l | grep -e ^Name: -e ^State | sed s/\ \ //g | cut -d: -f2- 
Debian - "Kolab dev"
 powered off (since 2013-07-19T21:17:55.000000000)
Crunchbang
 paused (since 2013-07-20T10:13:07.771000000)
Deepin
 powered off (since 2013-06-29T15:56:04.000000000)
```

#### Save the current state of the VM to disk and then stop the VM
- ``` VBoxManage controlvm "vm-name" savestate ```

#### Start VM in headless mode with starting Console Window
- ``` VBoxManage.exe startvm origin-1.1.2 --type headless ```
