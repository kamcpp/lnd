GO_SRC="/go/src"
LND_REPO="github.com/kamcpp/lnd"
LND_DIR="$GO_SRC/$LND_REPO"

cd $LND
dep ensure
cd /
./build.sh $LND_REPO
