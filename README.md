# Oracle JDK Docker

This repo contains a basic `Dockerfile` for Ubuntu with Oracle Java.

## How to build

1. Clone this repo and `cd` to the repo folder.

   `git clone https://github.com/BWibo/oracle-java-docker.git && cd oracle-java-docker`

2. Download Oracle JDK Linux `tar.gz` from: https://www.oracle.com/de/java/technologies/javase-downloads.html

   For JDK version 11.0.10 you will get ``jdk-11.0.10_linux-x64_bin.tar.gz``.

3. Copy this file to the repo root.

4. Build image:

   `docker build -t myrepo/oracle-jdk:jdk-11.0.10 --build-arg JAVA_VERSION=jdk-11.0.10`.

5. Test image:

   ```shell
   $ docker run --rm myrepo/oracle-jdk:jdk-11.0.10 java -version

   java version "11.0.10" 2021-01-19 LTS
   Java(TM) SE Runtime Environment 18.9 (build 11.0.10+8-LTS-162)
   Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.10+8-LTS-162, mixed mode)
   ```

### Build args

| Arg           | Default                                | Description                                                                                           |
|---------------|----------------------------------------|-------------------------------------------------------------------------------------------------------|
| BASEIMAGE_TAG | `20.04`                                | Tag of the `ubuntu` Docker image to use as base image                                                 |
| JAVA_VERSION  | `jdk-11.0.10`                          | Java version that is used. Name of the jdk folder inside the downloaded JDK `*.tar.gz`                 |
| JAVA_FILENAME | `${JAVA_VERSION}_linux-x64_bin.tar.gz` | File name of the downloaded JDK `*.tar.gz`                                                              |
| INSTALL_DIR   | `/usr/lib/jdk`                         | Install dir of the JDK inside the container. `$JAVA_HOME` will be set to `$INSTALL_DIR/$JAVA_VERSION` |
