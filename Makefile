BIN_NAME="code_monitor"
DIR=data
$(shell mkdir -p ${DIR})

# Go build flags
LDFLAGS=-ldflags "-s -w"

default:
	go build ${LDFLAGS} -o ${DIR}/Yi cmd/main.go

# Compile Server - Windows x64
windows:
	export GOOS=windows;export GOARCH=amd64;go build ${LDFLAGS} -o ${DIR}/${BIN_NAME}.exe cmd/main.go

# Compile Server - Linux x64
linux:
	export GOOS=linux;export GOARCH=amd64;go build ${LDFLAGS} -o ${DIR}/${BIN_NAME}_linux cmd/main.go

# Compile Server - Darwin x64
darwin:
	export GOOS=darwin;export GOARCH=amd64;go build ${LDFLAGS} -o ${DIR}/${BIN_NAME}_darwin cmd/main.go

# clean
clean:
	rm -rf ${DIR}