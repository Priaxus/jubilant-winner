# 2LA - Test Practice, HMACs & Base64

###### tags: `ISS` `Week 2` `Lab`

:::info
- **Date:** Oct 14, 2021
- **Summary:**
    - Did some practice for the week 4 test
    - HMACs
    - Base64
:::

## Practicing for test
### Types of hash
To find type of hash - `cat FILENAME | head -1 | wc -c`
How to interpret output:

| Output | Hash   |
| ------ | ------ |
| 33     | md5    |
| 41     | sha1   |
| 57     | sha224 |
| 65     | sha256 |
| 97     | sha384 |
| 129    | sha512 |

### To check a hash
From the directory where the files to be validated are:
`sha256sum -c --quiet PATHtoHASHFILE` 

### To check a duplicate
`cat HASHFILE | cut ==find how to cut on space== | sort | uniq -d`
:::danger
NOTE TO SELF LOOK INTO GREPPING THROUGH IT
:::

### HMac

It is important to use `echo -n` with echo as this supresses newline.

Look into this!!

## Base64

Method of encoding binary using printable characters.
### Examples

The 64 characters available to B64: `ABCDEFGHOIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/`

aaaa aa | aa bbbb | bbbb cc | cc cccc (split into groups of 6 bits)

`0000 00 | 00 0000 | 0000 00 | 00 0000` (raw binary (split into groups of 6 bits))
`0000 0000 | 0000 0000 | 0000 0000` (raw binary (what you'd need the bytes to be to achieve desired ascii char))
`00      00      00` (hex of binary byte)
`echo -en "\x00\x00\x00" | base64` = `AAAA`

`0000 00 | 00 0001 | 0000 00 | 00 0000` (raw binary (split into groups of 6 bits))
`0000 0000 | 0001 0000 | 0000 0000` (raw binary (what you'd need the bytes to be to achieve desired ascii char))
`00      10      00` (hex of binary byte)
`echo -en "\x00\x10\x00" | base64` = `ABAA`

`0000 00 | 00 0001 | 0000 10 | 00 0000` (raw binary (split into groups of 6 bits))
`0000 0000 | 0001 0000 | 1000 0000` (raw binary (what you'd need the bytes to be to achieve desired ascii char))
`00      10      80` (hex of binary byte)
`echo -en "\x00\x10\x80" | base64` = `ABCA`

`0000 00 | 00 0001 | 0000 10 | 00 0011` (raw binary (split into groups of 6 bits))
`0000 0000 | 0001 0000 | 1000 0011` (raw binary (what you'd need the bytes to be to achieve desired ascii char))
`00      10      83` (hex of binary byte)
`echo -en "\x00\x10\x83" | base64` = `ABCD`

0000 0000 | 0000 0000 | 0000 0000 | 0000 0000
0000 00 | 00 0000 | 0000 00 | 00 0000 | 0000 00 | 00


## Test advice
Get good at:
- `cut` or `awk`
- `uniq`
- `sort`
- how to concatenate stdin with files

Base64 MAY show up in Q8