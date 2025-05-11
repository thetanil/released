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
