FROM alpine:3.9

RUN echo 'http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --update kubernetes \
    && mkdir -p /root/.kube \
    && rm -rf /usr/bin/kubelet \
              /usr/bin/kubeadm \
              /usr/bin/kube-scheduler \
              /usr/bin/kube-proxy \
              /usr/bin/kube-controller-manager \
              /usr/bin/kube-apiserver \
              /usr/bin/hyperkube \
    && wget https://storage.googleapis.com/kubernetes-helm/helm-v2.12.3-linux-amd64.tar.gz -O helm.tar.gz \
    && tar -zxvf helm.tar.gz \
    && cp linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 helm.tar.gz
