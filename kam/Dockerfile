FROM karalabe/xgo-latest

RUN apt-get update
RUN apt-get install -y vim tmux
RUN go get -u github.com/golang/dep/cmd/dep
RUN echo "export PATH=$PATH:/go/bin" >> /root/.bashrc

RUN mkdir -p /go/src/github.com/kamcpp
RUN cd /go/src/github.com/kamcpp && git clone https://github.com/kamcpp/lnd
RUN cd /go/src/github.com/kamcpp/lnd && git fetch
RUN cd /go/src/github.com/kamcpp/lnd && git checkout newmerge
RUN cd /go/src/github.com/kamcpp/lnd && git pull origin newmerge
RUN ln -s /go/src/github.com/kamcpp/lnd/olu.sh /olu.sh

ENTRYPOINT /olu.sh && /bin/bash
