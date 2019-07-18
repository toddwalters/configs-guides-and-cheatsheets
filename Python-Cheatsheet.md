# Python CheatSheet

## update all packages

```
for i in `pip freeze | awk -F "=" '{print $1}'`; do pip install --upgrade $i; done
```