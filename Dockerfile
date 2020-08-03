FROM ubuntu:focal

ARG PACKAGE=factor-linux-x86-64-2020-07-07-15-15.tar.gz

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		netbase \
        software-properties-common \
	&& rm -rf /var/lib/apt/lists/*

RUN set -ex; \
	if ! command -v gpg > /dev/null; then \
		apt-get update; \
		apt-get install -y --no-install-recommends \
			gnupg \
			dirmngr \
		; \
		rm -rf /var/lib/apt/lists/*; \
	fi

ENV PATH $PATH:/usr/local/factor

RUN set -eux \
    && curl -OL https://downloads.factorcode.org/linux-x86-64/${PACKAGE} \
    && tar -zxf ${PACKAGE} -C /usr/local\
    && rm -rf ./${PACKAGE}
