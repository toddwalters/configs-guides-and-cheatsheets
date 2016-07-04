[Installing CDK 2.0 RHEL] (https://access.redhat.com/documentation/en/red-hat-container-development-kit/2.0/installation-guide/#installing_virtualization_and_cdk_components)

If after installing vagrant on your RHEL box you get errors like the following when attempting to execute the vagrant command:

```
vagrant status
/usr/share/rubygems/rubygems/core_ext/kernel_require.rb:55:in `require': cannot load such file -- json/pure (LoadError)
	from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb:55:in `require'
	from /opt/rh/rh-ruby22/root/usr/share/gems/gems/json-1.8.1/lib/json.rb:60:in `rescue in <module:JSON>'
	from /opt/rh/rh-ruby22/root/usr/share/gems/gems/json-1.8.1/lib/json.rb:57:in `<module:JSON>'
	from /opt/rh/rh-ruby22/root/usr/share/gems/gems/json-1.8.1/lib/json.rb:54:in `<top (required)>'
	from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb:135:in `require'
	from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb:135:in `rescue in require'
	from /usr/share/rubygems/rubygems/core_ext/kernel_require.rb:144:in `require'
	from /opt/rh/sclo-vagrant1/root/usr/share/vagrant/lib/vagrant/plugin/state_file.rb:1:in `<top (required)>'
	from /opt/rh/sclo-vagrant1/root/usr/share/vagrant/lib/vagrant/plugin/manager.rb:6:in `require_relative'
	from /opt/rh/sclo-vagrant1/root/usr/share/vagrant/lib/vagrant/plugin/manager.rb:6:in `<top (required)>'
	from /opt/rh/sclo-vagrant1/root/usr/share/vagrant/lib/vagrant/pre-rubygems.rb:20:in `require_relative'
	from /opt/rh/sclo-vagrant1/root/usr/share/vagrant/lib/vagrant/pre-rubygems.rb:20:in `<main>'
```

**Resolution:** Enable the Vagrant Software Collection and verify that things are set up to run Vagrant as a regular, non-root user:
```
$ scl enable sclo-vagrant1 bash
$ vagrant global-status
```
