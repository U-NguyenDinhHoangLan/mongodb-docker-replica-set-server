# Table of contents
1. [Credit](#credit)
2. [Prerequisites](#prerequisites)
3. [Explanation](#explanation)
4. [Default MongoDB version](#default-mongodb-version)
5. [Installation](#installation)
    - [MacOS](#macos)
    - [Windows](#windows)
    - [Linux](#linux)
6. [Tests](#tests)

# Credit
This setup is based on this gist
[a-mongodb-replica-set-docker-compose-readme.md](https://gist.github.com/harveyconnor/518e088bad23a273cae6ba7fc4643549) by user [harveyconnor](https://gist.github.com/harveyconnor)

# Prerequisites
- Docker & docker compose

# Explanation
This setup will start a local MongoDB Replica Set containing 3 instances:
- mongo1:30001 (localhost:30001)
- mongo2:30002 (localhost:30002)
- mongo3:30003 (localhost:30003)

# Default MongoDB version
This setup currently uses [mongo:4.2.7](https://hub.docker.com/layers/library/mongo/4.2.7/images/sha256-425ecf5dd6f35766a92f49ecb2ca4411ea6976534a07155ac9edef481e725aec?context=explore)

# Installation
## MacOS
Naivate `/private/etc/`, where it contains your `hosts` file:
```sh
cd /private/etc/
```

You can edit the file using `nano` (or any text editor you prefer):
```sh
sudo nano hosts
```

The contents of `hosts` should look like this:
```
127.0.0.1	localhost mongo1 mongo2 mongo3
```
or this:
```
127.0.0.1   mongo1
127.0.0.1   mongo2
127.0.0.1   mongo3
```

After seeting up `hosts`, run the following command in the root of this project to run the Replica Sets:
```sh
docker-compose up --detach
```

## Windows
This setup have not been tested on Windows systems

## Linux
This setup have not been tested on Linux systems

# Tests
The default connection URI will be `mongodb://mongo1:30001,mongo2:30002,mongo3:30003/?replicaSet=rs0`