# HMAC Lengths

If HMAC is in binary, its length should correspond to one of the following which can be used to tell you what hashing algorithm has been used:
```
| Length | Hashing Algorithm |
|--------|-------------------|
|   16   |        md5        |
|   20   |       sha1        |
|   28   |      sha224       |
|   32   |      sha256       |
|   48   |      sha384       |
|   64   |      sha512       |
```
I have worked this out by running: 
`openssl dgst -sha1/224/256/384/512/md5 -binary -hmac "abcdefgh12345678" < f0001 | wc -c`