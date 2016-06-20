FROM quay.io/nordstrom/python:2.7
MAINTAINER Store Modernization Platform Team "invcldtm@nordstrom.com"

ARG CURATOR_VERSION

USER root 

# Install elasticsearch-curator
RUN pip install --upgrade pip && \
    pip install setuptools && \
    pip install --quiet elasticsearch-curator==${CURATOR_VERSION}

USER ubuntu

ENTRYPOINT ["curator"]
CMD ["--help"]