FROM ubuntu:focal

ARG FACTOR_VERSION=2020-07-07-15-15
ARG PACKAGE=factor-linux-x86-64-${FACTOR_VERSION}.tar.gz

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		apt-utils \
		curl \
	&& rm -rf /var/lib/apt/lists/*

ENV PATH /usr/local/factor:$PATH

RUN set -eux \
    && curl -s -OL https://downloads.factorcode.org/linux-x86-64/${PACKAGE} \
    && tar -zxf ${PACKAGE} -C /usr/local \
    && rm -rf ./${PACKAGE}

