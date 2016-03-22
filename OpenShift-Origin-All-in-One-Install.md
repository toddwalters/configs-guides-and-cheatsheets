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

Applications can be seen using Modified Host plugin in firefox
* Plugin is called "Modify Headers"
* Need to add example of how to leverage the plugin


ngrox was run from a windows cmd window
