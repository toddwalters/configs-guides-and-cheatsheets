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
