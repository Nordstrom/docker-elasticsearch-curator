FROM quay.io/nordstrom/python:2.7
MAINTAINER Store Modernization Platform Team "invcldtm@nordstrom.com"

ENV CURATOR_RELEASE 3.5.1

# Install elasticsearch-curator
RUN pip install elasticsearch-curator==${CURATOR_RELEASE}

USER nobody

ENTRYPOINT ["curator"]

CMD ["--help"]
