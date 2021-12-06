# Hashing Test Notes
###### tags: `Assessment` `ISS`

## Q1) Explaining your reasoning, identify which cryptographic hashes were used to produce

:::success
1. Set `x="hashset-NAME"`
2. Run `determineHashingAlgorithm`
:::
:::danger
1. Run `cat hashset-NAME | head -1 | cut -f 1 -d ' ' | wc -c`
2. Result: `33=md5`, `41=sha1`, `57=sha224`, `65=sha256`, `97=sha384`, `129=sha512`
:::

## Q2) Identify which files are present in the archive but have different content from when `hashset-earlier` was taken.

:::info
Achieved by running `sha256sum -c --quiet ../hashset-earlier`
The files for this question are the ones that just say `FAILED`
:::

## Q3) Identify which files are now missing from the archive but were there when `hashset-earlier` was taken

:::info
Achieved by running `sha256sum -c --quiet ../hashset-earlier`
The files for this question are the ones that say `FAILED open or read`
:::

## Q4) Identify which files in `hashset-earlier` are duplicates of other files in `hashset-earlier`

:::success
1. `cat hashset-earlier | cut -f 1 -d ' ' | sort | uniq -d > x`
2. `x="x"`
3. `y="hashset-earlier"`
4. `compareHashFiles`
:::

:::danger
1. `cat hashset-earlier | cut -c 1-65 | sort | uniq -d > x`
2. `cat hashset-earlier | grep EACH-HASH`
:::

## Q5) Identify which files in the archive have been renamed from the name used in `hashset-earlier` to the name now in use in the archive

These will be files that are 'deleted' (the ones in q3) but their hashes still appear in `hashset-earlier`

:::success
Achieved by running:
1. `sha256sum * > ../hashset-now`
2. `hashsetEarlier="hashset-earlier"`
3. `hashsetToSearch="hashset-sha256"`
4. `targetFile="fxxxx"`
5. `searchForRenames`

>Remember to change the hashing function in steps 1 and 3 depending on what `hashset-earlier` is
:::

:::danger

:::

## Q6 Identify which files are known malware.
I will need to compare the files in the archive to see if they have any same hashes as the ones in `hashset-bad`

:::info
Achieved by running:
- `md5sum * > ../hashset-md5`
- `hashsetA="hashset-bad"`
- `hashsetB="hashset-md5"`
- `compareHashFiles`
:::

## Q7) Find all not in `hashset-bad` nor in `hashset-good`

:::info
Achieved by running:
1. `sha512sum * > ../hashset-sha512-now`
2. `./compare-hash-files.sh hashset-good hashset-sha512-now`
3. `./compare-hash-files.sh hashset-bad hashset-md5-now`
4. `cat comparison-output-file | cut -f 3 -d " " | sort > allgoodsandbads`
5. `./find-not-in-list.sh`
:::