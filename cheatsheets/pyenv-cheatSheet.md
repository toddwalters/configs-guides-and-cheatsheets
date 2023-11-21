# pyenv CheatSheet

### Links 

- [Intro to pyenv](https://realpython.com/intro-to-pyenv/)

### List available version of python 3.10 that could be installed

`pyenv install --list | grep " 3\.10\.*"`

### Install a particular version of python

`pyenv install -v 3.10.13`

### List installed version of python

```zsh
$ pyenv versions
  system
* 3.10.13 (set by /Users/toddwalters/.pyenv/version)
```

### Activate specific version of python

```zsh
$ pyenv global 2.7.15
$ python -V
Python 2.7.15

$ pyenv versions
  system
* 2.7.15 (set by /home/realpython/.pyenv/version)
  3.6.8
  3.8-dev
```