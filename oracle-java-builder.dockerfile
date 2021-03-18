# Build sunpot-core ###########################################################
ARG JAVA_VERSION='jdk-11.0.10'
FROM bsvr.gis.lrg.tum.de/oracle-java:${JAVA_VERSION}

ENV JAVA_VERSION=$JAVA_VERSION

# Install git, wget
RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends git wget unzip ca-certificates && \
  rm -rf /var/lib/apt/lists/*

# Install gradle
ARG GRADLE_VERSION='6.8.3'
ENV GRADLE_VERSION=$GRADLE_VERSION

RUN set -x && \
  wget "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -O /gradle.zip && \
  unzip /gradle.zip && \
  rm -v /gradle.zip && \
  mv -v /gradle-${GRADLE_VERSION}/ /gradle/ && \
  chmod -v u+x /gradle/bin/gradle

ENV PATH="$PATH:/gradle/bin"
