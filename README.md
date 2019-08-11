# AWS CLI and shell

Container with [aws-cli] and [aws-shell] installed.

An automated build of this image is on Docker Hub: https://hub.docker.com/r/moreutils/awscli/

[aws-cli]: https://github.com/aws/aws-cli
[aws-shell]: https://github.com/awslabs/aws-shell

## Examples

### Calling aws-cli directly

```
$ cat aws.env
AWS_ACCESS_KEY_ID=1234...
AWS_SECRET_ACCESS_KEY=ABCD....
AWS_DEFAULT_REGION=us-east-1
$ docker run --rm --env-file aws.env morecontainers/awscli aws s3 ls
2017-11-05 12:48:32 my-bucket
```

### Docker Engine and DigitalOcean Spaces

```
$ cat do.env
AWS_ACCESS_KEY_ID=1234...
AWS_SECRET_ACCESS_KEY=ABCD....
AWS_ENDPOINT_URL=https://ams3.digitaloceanspaces.com
$ mkdir -p ~/.aws ~/data
$ docker run -it --rm -w /data -v ~/.aws:/.aws -v ~/data:/data --user $(id -u):$(id -g) --env-file do.env morecontainers/awscli
Creating doc index in the background. It will be a few minutes before all documentation is available.
aws> !pwd
/data
aws> !ls
aws> s3 ls
2017-11-05 12:48:32 my-bucket
aws> s3 ls my-bucket
2017-11-05 12:48:32       2044 welcome.html
aws> s3 cp s3://my-bucket/welcome.html .
download: s3://my-bucket/welcome.html to ./welcome.html        
aws> !ls
welcome.html
aws> .exit
$ ls ~/data
welcome.html
```

### Podman and DigitalOcean Spaces

```
$ cat do.env
AWS_ACCESS_KEY_ID=1234...
AWS_SECRET_ACCESS_KEY=ABCD....
AWS_ENDPOINT_URL=https://ams3.digitaloceanspaces.com
$ podman run -it --rm -v ~/data:/data --env-file do.env morecontainers/awscli
Creating doc index in the background. It will be a few minutes before all documentation is available.
aws> s3 ls
2017-11-05 12:48:32 my-bucket
aws> s3 ls my-bucket
2017-11-05 12:48:32       2044 welcome.html
aws> s3 cp s3://my-bucket/welcome.html /data
download: s3://my-bucket/welcome.html to data/welcome.html        
aws> !ls data
welcome.html
aws> .exit
$ ls ~/data
welcome.html
```

## TODO

- [ ] Support for Docker secrets and `~/.aws/credentials`?

## Contact developers

https://gitter.im/morecontainers/
