# Types of Hash
###### tags: `Assessment` `ISS`
## Q1 - Types of hash
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
`cat HASHFILE | cut -c 1-NO.oFcHARSiNhASH | sort | uniq -d`
:::danger
NOTE TO SELF LOOK INTO GREPPING THROUGH IT
:::