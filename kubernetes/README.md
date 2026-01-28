# Kubernetes CKA/CKAD Cheat Sheet

## Configuración inicial del examen

```bash
# Autocompletado (PRIMER PASO EN EL EXAMEN)
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
alias k=kubectl
complete -o default -F __start_kubectl k
```

## Variables útiles

```bash
export do='--dry-run=client -o yaml'
export now='--force --grace-period=0'
```

## Comandos rápidos esenciales

### Crear recursos

```bash
# Pod
k run nginx --image=nginx $do > pod.yaml
k run nginx --image=nginx --port=80 --labels=app=web

# Deployment
k create deploy nginx --image=nginx $do > deploy.yaml
k create deploy nginx --image=nginx --replicas=3

# Service
k expose pod nginx --port=80 --target-port=8080
k create svc clusterip nginx --tcp=80:8080 $do

# Job
k create job test --image=busybox $do -- echo "Hello"

# CronJob
k create cronjob test --image=busybox --schedule="*/5 * * * *" -- echo "Hello"

# ConfigMap
k create cm config --from-literal=key=value $do

# Secret
k create secret generic mysecret --from-literal=password=pass $do
```

### Debugging

```bash
# Logs
k logs nginx -f
k logs nginx --previous
k logs -l app=nginx

# Exec
k exec -it nginx -- /bin/bash

# Events
k get events --sort-by=.metadata.creationTimestamp

# Top
k top nodes
k top pods -A --sort-by=memory
```

### Labels y Selectors

```bash
k label pod nginx env=prod
k get pods -l env=prod
k get pods --show-labels
```

### RBAC

```bash
k create sa mysa
k create role pod-reader --verb=get,list --resource=pods
k create rolebinding read-pods --role=pod-reader --serviceaccount=default:mysa
k auth can-i create pods --as mysa
```

## Tips para el examen

1. **Alias y autocompletado primero**
2. **Usar --dry-run=client -o yaml**
3. **kubectl explain** es tu mejor amigo
4. **Kubernetes.io** está permitido
5. **Marca y continúa** si te atascas

## Recursos permitidos

- https://kubernetes.io/docs/
- https://kubernetes.io/blog/
- https://helm.sh/docs/
