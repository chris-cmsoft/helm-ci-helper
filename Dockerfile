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
    && wget https://storage.googleapis.com/kubernetes-helm/helm-v2.12.3-linux-arm64.tar.gz -O helm.tar.gz \
    && tar -zxvf helm.tar.gz \
    && cp linux-arm64/helm /usr/local/bin/helm \
    && rm -rf linux-arm64 helm.tar.gz
