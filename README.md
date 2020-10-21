# README #


### 前提 ###
* マウントされた該当ストレージ領域における任意のディレクトリに、Kubernetesがインストールされていること
* Kubernetesが起動していること

### セットアップ ###

[1] マウントされた該当ストレージ領域における任意のディレクトリで、本マイクロサービスをクローンする  
[2] 証明書発行前に、/etc/sslディレクトリにあるopenssl.cnfファイルに以下設定を追加する  

```
cd /etc/ssl
sudo vim openssl.cnf
```

```
subjectAltName = IP:自IP
```
※[ v3_ca ]の下の行に上記内容を追加する


[3] 本マイクロサービスがクローンされているディレクトリ直下で、下記コマンドを実行する  

```
$ make init
$ make apply
```

[4] make initの実行で出力された内容に沿って、デプロイ先端末にファイルを作成する

ファイルの配置場所: /etc/docker/certs.d/192.168.128.XXX:31112 ※XXXは、証明書発行元のIPアドレス

ファイル名: ca.crt

デプロイ先端末で、下記を実行する

```
cd /etc/docker
sudo mkdir certs.d
sudo mkdir 192.168.128.XXX:31112　⇒XXXは、証明書発行元のIPアドレス
sudo vim ca.crt
```

ca.crtファイルに、make initで出力されたCERTIFICATEの内容を追加する。
※BEGIN CERTIFICATEからEND CERTIFICATEまでを追加する

make initの出力例)
```
set following file on client!
dir: /etc/docker/certs.d/192.168.128.164:31112
file: ca.crt
content:

-----BEGIN CERTIFICATE-----
MIIFsDCCA5igAwIBAgIUex0SC8EbO84l1pCqfBGMb0X/a6swDQYJKoZIhvcNAQEL
BQAwXzELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM
GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDEYMBYGA1UEAwwPMTkyLjE2OC4xMjgu
MTY0MB4XDTIwMDYxMDA4MDExMVoXDTIxMDYxMDA4MDExMVowXzELMAkGA1UEBhMC
QVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoMGEludGVybmV0IFdpZGdp
dHMgUHR5IEx0ZDEYMBYGA1UEAwwPMTkyLjE2OC4xMjguMTY0MIICIjANBgkqhkiG
9w0BAQEFAAOCAg8AMIICCgKCAgEA2QO/thb30Wv3sWuEecbk39N2+wgwZdd3cPDf
bSMc+8v49ERLYA6mShENe5NCRmoWXVTJl8+054mbPhKSTsaZs/huRYXCuda9bh6s
QbN9XJUre5MCmLZkpwB2meI7wJkdER5rZnvBZxfgtxaj13TXWwyY737dj++JlVyE
V0MCc/WBa1+JKNbcuRW4DCuFqll5oZPy5fcqBqUDlUL880il0nv0lR5SulMPERGZ
U3VO1p5QXCo14jHEODA9VxxpoH/CmvDEFiLe//CLvnkqXjZ33NXCUfNjgWvNGsRC
Mp7O+1V3/yCtAijtah25VT7xyAzlPAFNNC1f5K2GVsVPAcdvhTT1IKE1nrrwmpnD
izeR+xGFZxCu/bcm8M8F7NHEIDMRFoeg36GB/nHVoMaGBYLGcugJ7vnXVoGQbtLz
LqMx6irpOIS24iHaYlYu6EFkHmKTgigSk1RUpB6D7uqtrbjM5njQR72CBYOm0IUH
Gy3Z7D43SrCj7YuW5VxzQ13F5S0z+9fr9+wD8yDwdqK4QwZLsJNWN6EA7ZZovDt5
yVo5eN4bYDhzTU8UjqegIoyIyC/Ltc+t8r+llgXIfu0fhbq4QTaGpxZCGjaNdexX
jdcAj9lOq7p8GOiSHf6GtXyjpjsAfJ5OphVjOkNe69f5a8qo1ym21ELDEOrLBsPr
i0MIDyECAwEAAaNkMGIwDwYDVR0RBAgwBocEwKiApDAdBgNVHQ4EFgQUCEZenwpM
KDn/ouChxRPREtHtvacwHwYDVR0jBBgwFoAUCEZenwpMKDn/ouChxRPREtHtvacw
DwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAgEAydcFIBLvqxrN9pdT
x1zT0baO3fqh6gQekiku6rNlvcncLdCl1sTZpAbHKsuwDduL3NPQ8TTvNLoa2tNm
Yrw+6dVQFC+zq5mxZL0DG66cipuy7E8zCVIXIwuxilgyue3J8Kz6s+QrHkT7MoxO
rZrU/aNrYPsHsihqrLk050XMb12+CG49yURYXlsEJSWpKtnUHPPPsA8/anCypTXB
f5PWPYQsCQgR3UEsikoca5tVN2DuUlSm0xQBtOPXEeq41m7TpEpW7mko8mhmp1pE
Uehveh7m/ynKh0nEoglLxIbhIU6X9gqqknDKEWpfml/90/2SBHRQ9v6Pfqyp9G70
WweLwR0wqBVj+5FdB/Sk30hwVwyHqfO6NNkMR4oKz3M6jrcysx18HwmLQF1ZcS50
D4Cib48IoRaXZZJBOdIpq0OvkBPMFLdCMw32OMaZ3WozbHnIAKKyypFRVb0pDnaN
IDTvYCq/3rC3jz+cUbsI5dRZ8BNegNOTTLriIPEiMEY8ANcoZfGFBFU9YU+VOIFl
TznO0hOud0MfcOv09K8z/lnJU4yUP2G4+0RDhDJ5XjjKbOEbdPsQVgmoj287FAWB
RxtyITG8DXXqikxgbxWNJGs/35NO4mXVBbIl4uw1hKsrBTdLf0dNxyw7HaNXs39/
zxEgrsBS7W0gzA6FIusodlHALmA=
-----END CERTIFICATE-----
```