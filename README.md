# What is `medpeer/rails_cred`

A minimal Docker image for editing Credentials provided by Rails.

## How to use this image

```
$ docker run -it --rm \
    -e RAILS_MASTER_KEY=$RAILS_MASTER_KEY \
    -v `pwd`/config/credentials.yml.enc:/app/config/credentials.yml.enc \
    -v `pwd`/config/credentials:/app/config/credentials \
    medpeer/rails_cred
```
