##### Create a docker machine VM with Proxy Variables Defined
```
docker-machine create -d virtualbox \
    --engine-env HTTP_PROXY=http://10.20.30.40:9000 \
    --engine-env HTTPS_PROXY=http://10.20.30.40:9000 \
    --engine-env NO_PROXY=lilly.com \
    proxbox
```
##### Start the proxbox vm via the docker-machine command
```
PS C:\pub> docker-machine start proxbox
```

##### Verify the proxbox configuration
```
PS C:\pub> docker-machine config proxbox
```
You should see output that looks like this:
```
PS C:\pub> docker-machine config proxbox
--tlsverify
--tlscacert="C:\\Users\\User123\\.docker\\machine\\certs\\ca.pem"
--tlscert="C:\\Users\\User123\\.docker\\machine\\certs\\cert.pem"
--tlskey="C:\\Users\\User123\\.docker\\machine\\certs\\key.pem"
-H=tcp://192.168.99.100:2376
```

If an error message related to the validity of the certificate is observered similar to the example below:

```
Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": x509: certificate is valid for 192.1
68.99.102, not 192.168.99.100
You can attempt to regenerate them using 'docker-machine regenerate-certs [name]'.
Be advised that this will trigger a Docker daemon restart which will stop running containers.
```

Follow the advice given and execute the `regenerate-certs` option of the `docker-machine` command.

```
PS C:\pub> docker-machine regenerate-certs proxbox
Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y

Regenerating TLS certificates
Waiting for SSH to be available...
Detecting the provisioner...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
```

##### Review list of docker-machinve vm's
```
PS C:\pub> docker-machine ls
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER    ERRORS
default   -        virtualbox   Stopped                                       Unknown
proxbox   -        virtualbox   Running   tcp://192.168.99.100:2376           v1.12.3
```

#####  Display commands to set up the environment for proxbox VM
```
PS C:\pub> docker-machine env proxbox
$Env:DOCKER_TLS_VERIFY = "1"
$Env:DOCKER_HOST = "tcp://192.168.99.100:2376"
$Env:DOCKER_CERT_PATH = "C:\Users\User123\.docker\machine\machines\proxbox"
$Env:DOCKER_MACHINE_NAME = "proxbox"
# Run this command to configure your shell:
# & "C:\Program Files\Docker Toolbox\docker-machine.exe" env proxbox | Invoke-Expression
```

##### Run the necessary command to set-up the environment variables within PowerShell session
```
PS C:\pub> & "C:\Program Files\Docker Toolbox\docker-machine.exe" env proxbox | Invoke-Expression
```

Review the list of docker-machine VM's and verify that the proxbox VM has an * in the ACTIVE column of the output
```
PS C:\pub> docker-machine ls
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER    ERRORS
default   -        virtualbox   Stopped                                       Unknown
proxbox   *        virtualbox   Running   tcp://192.168.99.100:2376           v1.12.3
```

##### Verify that docker client can talk to docker server on active docker-machine VM
```
PS C:\pub> docker version
Client:
 Version:      1.12.2
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   bb80604
 Built:        Tue Oct 11 17:00:50 2016
 OS/Arch:      windows/amd64

Server:
 Version:      1.12.3
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   6b644ec
 Built:        Wed Oct 26 23:26:11 2016
 OS/Arch:      linux/amd64
```
If you receive and error message associated with not being able to communicate with the Docker server like the example below:  

```
PS C:\pub> docker info
An error occurred trying to connect: Get https://192.168.99.100:2376/v1.24/info: Forbidden
PS C:\pub> docker version
Client:
 Version:      1.12.2
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   bb80604
 Built:        Tue Oct 11 17:00:50 2016
 OS/Arch:      windows/amd64
An error occurred trying to connect: Get https://192.168.99.100:2376/v1.24/version: Forbidden
```

This is more than likely a result of existing https_proxy environment variables that are active in your terminal/powershell session.  YOu will need to updated or create a no_proxy environment variable that includes the IP address of the docker-machine VM that has been started up (i.e. proxbox IP address).  

Below is an example of how to set this in a PowerShell Session:

```
PS C:\pub> $Env:no_proxy = "192.168.99.100"
```

Verify that you are noaw able to communicate to the docker-machine based Docker server VM
```
PS C:\pub> docker version
Client:
 Version:      1.12.2
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   bb80604
 Built:        Tue Oct 11 17:00:50 2016
 OS/Arch:      windows/amd64

Server:
 Version:      1.12.3
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   6b644ec
 Built:        Wed Oct 26 23:26:11 2016
 OS/Arch:      linux/amd64
```
