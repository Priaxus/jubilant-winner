# Practice Hashing Test
###### tags: `Assessment` `ISS`

:::info
This is my attempt at the practice hashing test
:::

## Q1) Explaining your reasoning, identify which cryptographic hashes were used to produce
##### Hashset-earlier
Uses `sha256`. This is because the length of each hash is `65`
##### Hashset-good
Uses `sha512`. This is because the length of each hash is `129`
##### Hashset-bad
Uses `md5`. This is because the length of each hash is `33`

:::info
Achieved by running `cat FILENAME | head -1 | wc -c`
Most of these matched
However, `hashset-earlier` was a bit over as it also included file names at the end of each line
:::

## Q2) Identify which files are present in the archive but have different content from when `hashset-earlier` was taken.
These are:
- `f0177`
- `f0297`
- `f0500`
- `f0504`
- `f0525`
- `f0645`

:::info
Achieved by running `sha256sum -c --quiet ../hashset-earlier`
The files for this question are the ones that just say `FAILED`
:::

## Q3) Identify which files are now missing from the archive but were there when `hashset-earlier` was taken
These are:
- `f0187`
- `f0375`
- `f0743`
- `f0808`
- `f0963`

:::info
Achieved by running `sha256sum -c --quiet ../hashset-earlier`
The files for this question are the ones that say `FAILED open or read`
:::

## Q4) Identify which files in `hashset-earlier` are duplicates of other files in `hashset-earlier`

All files in the same group are duplicates of eachother

| Group | Files                                    | Hash                                                               |
| ----- | ---------------------------------------- | ------------------------------------------------------------------ |
| 1     | `f0947`<br>`f0957`                       | `34fd05d291692ab038dec8de90c7490bcaa11e9c687267659d06fa8a03825ad7` |
| 2     | `f0085`<br>`f0444`<br>`f0490`<br>`f0825` | `58770a1f8abb0718146d546ff9860becfc01753982527b38bcea86d43cb4b9eb` |
| 3     | `f0599`<br>`f0680`<br>`f0801`            | `e3f245e909b3e4836614d1ceb119d8facfaca32cdaf5633d4590c7d3701d58f9` |

:::info
Achieved by running:
1. `cat hashset-earlier | cut -c 1-65 | sort | uniq -d`
2. `cat hashset-earlier | grep 34fd05d291692ab038dec8de90c7490bcaa11e9c687267659d06fa8a03825ad7`
3. `cat hashset-earlier | grep 58770a1f8abb0718146d546ff9860becfc01753982527b38bcea86d43cb4b9eb`
4. `cat hashset-earlier | grep e3f245e909b3e4836614d1ceb119d8facfaca32cdaf5633d4590c7d3701d58f9`
:::

## Q5) Identify which files in the archive have been renamed from the name used in `hashset-earlier` to the name now in use in the archive

These will be files that are 'deleted' (the ones in q3) but their hashes still appear in `hashset-earlier`

| Old Name | New Name | Hash                                                               |
| -------- | -------- | ------------------------------------------------------------------ |
| `f0743`  | `f0297`  | `c6755f9a62626796521fbc0213d629206288080ad77dd3c49db6fd9025d0abce` |
| `f0808`  | `f0500`  | `6d024a478834721e50453e44b48f0328bd5522e6d6ae255bc88fc69a5db6e7c0` |

:::info
Achieved by running:
1. `sha256sum * > ../hashset-now`
2. `./search-for-renames.sh hashset-earlier hashset-now f0187`
3. `./search-for-renames.sh hashset-earlier hashset-now f0375`
4. `./search-for-renames.sh hashset-earlier hashset-now f0743`
5. `./search-for-renames.sh hashset-earlier hashset-now f0808`
6. `./search-for-renames.sh hashset-earlier hashset-now f0963`
:::

## Q6 Identify which files are known malware.
I will need to compare the files in the archive to see if they have any same hashes as the ones in `hashset-bad`


| Malware File | Hash                               |
| ------------ | ---------------------------------- |
| `f0203`      | `c8628a17728567ee344ae1263e6f1fa3` |
| `f0524`      | `3634d36bec45d2e385ecbc67d2faec08` |
| `f0552`      | `0b68d92708f4f306f2d91f098efab9f4` |
| `f0763`      | `dffd29ba6efce7aee7d459321449132c` |
| `f0854`      | `aaaaba0780effaaa03e4acf66f0e3737` |

:::info
Achieved by running:
- `md5sum * > ../hashset-md5-now`
- `./malware-search.sh hashset-bad hashset-md5-now`
:::

## Q7) Find all not in `hashset-bad` nor in `hashset-good`

| Neutral File |
| ------------ |
| `f0117`      |
| `f0177`      |
| `f0261`      |
| `f0452`      |
| `f0504`      |
| `f0525`      |
| `f0645`      |
| `f0924`      |
| `f0970`      |

:::info
Achieved by running:
1. `sha512sum * > ../hashset-sha512-now`
2. `./compare-hash-files.sh hashset-good hashset-sha512-now`
3. `./compare-hash-files.sh hashset-bad hashset-md5-now`
4. `cat comparison-output-file | cut -f 3 -d " " | sort > allgoodsandbads`
5. `./find-not-in-list.sh`
:::