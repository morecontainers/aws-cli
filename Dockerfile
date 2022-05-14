FROM debian:stable-slim AS x
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends python3-pip groff \
 && rm -rf /var/lib/apt/lists/*
RUN python3 -m pip install --no-cache aws-shell
RUN aws-shell < /dev/null 2> /dev/null || true

FROM debian:stable-slim AS y
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y patch
COPY --from=x /usr/lib/python3/dist-packages/awscli/clidriver.py .
COPY clidriver.py.patch .
RUN patch clidriver.py clidriver.py.patch

FROM x
COPY --from=y clidriver.py /usr/lib/python3/dist-packages/awscli/
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
CMD ["aws-shell"]
