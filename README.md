# Kubernetes Initializer for LXCFS

> Initializers are an alpha feature and subject to change. Please report any Initializer specific issues on the [Kubernetes issue tracker](https://github.com/kubernetes/kubernetes/issues).

## Build

Build initializer

```
make build-container
```

#### Deploy  

Deploy LXCFS FUSE with DeamonSet

```
kubectl apply -f deploy/kubernetes/lxcfs-daemonset.yaml
```

Deploy initializer

```
kubectl apply -f deploy/kubernetes/lxcfs-initializer.yaml
```

#### Test

```
kubectl apply -f example/web.yaml
```

