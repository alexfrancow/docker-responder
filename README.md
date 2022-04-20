## Docker-based platform for conducting MultiRelay attacks using Responder

Responder is a LLMNR, NBT-NS and MDNS poisoner, with built-in HTTP/SMB/MSSQL/FTP/LDAP rogue authentication server supporting NTLMv1/NTLMv2/LMv2, Extended Security NTLMSSP and Basic HTTP authentication.

> https://github.com/lgandx/Responder

```bash
docker build -t responder .

# Example with HTTP, SMB, HTTPS Auth services
docker run -p 80:80 -p 443:443 -p 445:445 -it responder
```

## Deploy it on Azure with AKS

```bash
kubectl apply -f 05-az-ns.yml  10-az-svc.yml  15-az-deploy.yml

# Get public IP
kubectl get svc --namespace=pentesting
```
