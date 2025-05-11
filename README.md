# released
status overview for multiple release branches

- checkout tag to branch from
    - ```git checkout v0.1.0```
- this puts you in a detached head, that's ok
- create new release branch
    - ```git checkout -b release/v0.1.1```
- update VERSION.env file
- commit new VERSION.env
- push new release branch
    - ```git push -u origin release/v0.1.1```

## another one

 2056  git checkout main
 2057  git pull
 2058  git checkout -b release/v0.2.0

## this is all very wrong

v0.1.2
