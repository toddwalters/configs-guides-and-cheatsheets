**Chapter 5:  Building containers from our Sample website and Nginx image**

In order for the container deployed via Docker to be able to work with the volume mount directive on a RHEL 7 Docker Server with SELinux enabled the following command needs to be executed on the RHEL 7 host:

```
chcon -Rt httpd_sys_content_t $PWD/path/to/www
```

This ``chcon`` command can be issued before or after the docker run command listed below:

```
sudo docker run -d -p 80 --name website \ -v $PWD/website:/var/www/html/website \ jamtur01/nginx nginx
```

Until the ```chcon``` command is executed the following error will be generated when attempting to the nginx web server via the curl command:

```
root@e362ced87936:/# curl localhost:80
<html>
<head><title>403 Forbidden</title></head>
<body bgcolor="white">
<center><h1>403 Forbidden</h1></center>
<hr><center>nginx/1.4.6 (Ubuntu)</center>
</body>
</html>
root@e362ced87936:/# 
```

**Chapter 5:  Building our Sinatra application**

The following line in the Dockerfile
```
RUN gem install --no-rdoc --no-ri sinatra json redis
```
Results in the following error when attempting to build a docker image based on the file:
```
Step 5 : RUN gem install --no-rdoc --no-ri sinatra json:1.8.3 redis
 ---> Running in 33aae62145b8
ERROR:  Could not find a valid gem 'json:1.8.3' (>= 0) in any repository
```
In for the docker build to complete successfully I had to split the RUN command into two separate run commands:
```
RUN gem install --no-rdoc --no-ri sinatra redis
RUN gem install --no-rdoc --no-ri json -v 1.8.3
```
