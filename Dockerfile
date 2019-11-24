FROM golang:1.12.5 as builder

WORKDIR /go/src/app
ENV SRC_DIR=/go/src/github.com/

# Add the source code:
ADD . $SRC_DIR

# Build it:
RUN cd $SRC_DIR; go build -o myapp; cp myapp /app/

ENTRYPOINT ["./myapp"]
