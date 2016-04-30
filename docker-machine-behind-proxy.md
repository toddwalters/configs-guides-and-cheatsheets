
### Create Docker Host VM 
When creating the virtualbox VM that will be the Docker server you must set the proxy variables via the `--engine-env` flag of the `docker-machine` command
```
docker-machine create -d virtualbox \
    --engine-env HTTP_PROXY=http://example.com:8080 \
    --engine-env HTTPS_PROXY=https://example.com:8080 \
    proxbox
```
### Set `NO_PROXY` Variable in PowerShell
Set `NO_PROXY` Variable in PowerShell to ensure that the Docker Client running within Windows Client is able to talk to Docker Host virutal machine
On Windows Machine if using PowerShell, need to set the NO_PROXY environment variable to the IP address of the docker-machine.
```
PS C:\pub> docker-machine ls
NAME       ACTIVE   DRIVER       STATE     URL                         SWARM
proxybox   *        virtualbox   Running   tcp://192.168.99.100:2376

$Env:NO_PROXY = "192.168.99.100"

PS C:\pub> docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
