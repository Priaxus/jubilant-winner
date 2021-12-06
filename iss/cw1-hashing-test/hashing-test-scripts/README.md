# Q1
## Explaining your reasoning, identify which cryptographic hashes were used to produce

Use the `determine-hashing-algorithm.sh <hashet-name>` to work out the hashing algorithm used.

# Q2
## Identify which files are present in the archive but have different content from when `hashset-earlier` was taken.

Use the `sha1sum -c --quiet ../hashset-earlier` while in the `files` directory.

This might not be the `sha1sum`, use whichever is relevant.

The answers for this question are the ones that say `FAILED`

# Q3
## Identify which files are now missing from the archive but were there when `hashset-earlier` was taken

Use the `sha1sum -c --quiet ../hashset-earlier` while in the `files` directory.

This might not be the `sha1sum`, use whichever is relevant.

The answers for this question are the ones that say `FAILED open or read`

# Q4
## Identify which files in `hashset-earlier` are duplicates of other files in `hashset-earlier`

Run `cat hashset-earlier | cut -f 3 -d ' ' | sort | uniq -d` to generate a list of all the hashes that appear multiple times
For each of the duplicate hashes, run `cat hashset-earlier | grep <hash>`

# Q5
## Identify which files in the archive have been renamed from the name used in `hashset-earlier` to the name now in use in the archive

While in the files directory, run `sha256sum * > ../hashset-sha256-now`
Now `cd ..`
Then run this command for each file in the answers to Q3`./search-for-renames.sh hashset-earlier hashet-sha256-now <filename>` where `<filename>` is the filename

# Q6
## Identify which files in the archive have been renamed from the name used in hashset-earlier to the name now in use in the archive

Run `md5sum * > ../hashset-md5-now` while in the `files` folder
Then run `./compare-hash-files hashset-bad hashset-md5-now`

# Q7
## Find all not in `hashset-bad` nor in `hashset-good`

While in the files directory, run `sha512sum * > ../hashset-sha512-now`
Now `cd ..`
Run `./compare-hash-files hashset-good hashset-sha512-now`
Run `./compare-hash-files hashset-bad hashset-md5-now`
Run `cat comparison-output-file | cut -f 3 -d " " | sort > allgoodsandbads`. This creates a file with a list of all the files that are in either hashset-good or hashset-bad and are in the current `files` folder
Run `./find-not-in-list`

# Q8
## `f0000` contains the HMAC for another file in the archive. Find out which thing it is for

Find the hashing algorithm used by running `./determine-hashing-algorithm.sh f0000`
If that fails, do the following:
Find type of hash - `cat f0000 | head -1 | wc -c`

| Output | Hashing Algorithm   |
| :----: | :----: |
| 33     | md5    |
| 41     | sha1   |
| 57     | sha224 |
| 65     | sha256 |
| 97     | sha384 |
| 129    | sha512 |

If no matches, look here:

| Length | Hashing Algorithm |
|--------|-------------------|
|   16   |        md5        |
|   20   |       sha1        |
|   28   |      sha224       |
|   32   |      sha256       |
|   48   |      sha384       |
|   64   |      sha512       |

Then, once you've determined what hashing algorithm to use:

Make sure you're in the `files`

`./hmac-lister <hashing-algorithm>`
Then run `grep -Ff f0000 hmacs`