docker-travis
=============

Docker container for running travis locally. Intended for puppet modules.

Suggested commands:
```
docker run --rm -t -i local-travis:latest <ruby version> <puppet version> <git repo> <git commit>
```

Using local folder:
```
docker run --rm -v $(pwd):/mnt:ro -t -i travis:latest <ruby version> <puppet version> <git repo> <git commit>
```

For example:
```
docker run --rm -t -i local-travis:latest 1.8.7 3.7.5 https://github.com/emahags/puppet-module-vmware.git origin/master
```
