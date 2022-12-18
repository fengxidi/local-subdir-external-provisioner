#### 介绍

- 该项目用于基于本地持久化，动态创建pv
- 项目参考 [nfs-subdir-external-provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner) 实现 
- 只适用于 学习 kubernetes时使用
- 只用于单节点kubernetes环境



#### 快速使用

```shell
kubectl apply -f deploy/rbac.yaml  # 创建权限
kubectl apply -f deploy/local-subdir-external-provisioner.yaml # 部署

```



#### 测试

```shell
# 创建一个StorageClass
kubectl apply -f deploy/samples/StorageClass.yaml

# 创建pvc，创建pvc后会自动创建一个pv进行绑定
kubectl apply -f deploy/samples/test-claim.yaml
```









