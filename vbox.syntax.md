#### VBoxManage Man page
- [VBoxManage Manual link](https://www.virtualbox.org/manual/ch08.html)

#### Get a List of VirtualBox VMs
- List of all VM's: ``` VBoxManage list vms ```
- List of all "running" VM's: ``` VBoxManage list runningvms ```

#### Save the current state of the VM to disk and then stop the VM
- ``` VBoxManage controlvm "vm-name" savestate ```

#### Start VM in headless mode with starting Console Window
- ``` VBoxManage.exe startvm origin-1.1.2 --type headless ```
