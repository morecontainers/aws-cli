# AWS shell and cli

## Example usage with DigitalOcean Spaces

```
$ cat aws.env
AWS_ACCESS_KEY_ID=1234...
AWS_SECRET_ACCESS_KEY=ABCD....
AWS_ENDPOINT_URL=https://ams3.digitaloceanspaces.com

$ docker run -it --rm --env-file aws.env morecontainers/awscli
Creating doc index in the background. It will be a few minutes before all documentation is available.
aws> s3 ls
2017-11-05 12:48:32 my-bucket
aws>
```

## TODO

- [ ] Support for Docker secrets and `~/.aws/credentials`?

## Contact developers

https://gitter.im/morecontainers/
