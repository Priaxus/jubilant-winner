# SE Linux

have a look into SE linux colouring book

- Introduced MAC to control access to different levels of protectively marked data.
- Widely used across numerous linux distros (Fedora, Debian, Android, CentOS, RHEL etc.)
- Linux kernel security module that enforces MAC type access control on Linux systems
- Very granular, somewhat tricky, an excellent security layer

![](https://i.imgur.com/e7BGlci.png)

![](https://i.imgur.com/Ofl1Wc5.png)

Have a look at: `play.coker.com.au`. **use `-x -a` flags to protect yourself from counter attack.**
Dan Walsh is a good author to refer to.

## Fundamentals of SE Linux
1. SELinux is a LABELLING system
2. Every process has a LABEL
3. Every File, Directory, System object has a LABEL
4. Policy rules control access between labelled processes and labelled objects
5. The kernel enforces the rules

## Type enforcement
> Dog food example

SELinux type enforcement protects the host system from container processes

Default container process type:	
`svirt_lxc_net_t`

Default container file type:
`svirt_sandbox_net_t`

- Container processes can only read/execute /usr files
- Container processes can only write to container file types

This doesnt stop containers interfereing with each other^. to do that, you need Multi Category Security (MCS)

### MCS
- Every container is given a different MCS label in addition to the shared type label.
- Docker currently supports up to 500,000 concurrent containers with unique MCS labels
- Uniqueness is guaranteed by the docker daemon

#### MCS Enforcement

- Protects containers from each other
- Container processes can only read/write to their own files (files with a matching MCS label)
- Docker daemon picks out a random MCS label for each newly created container: e.g. `s0:c1,c2`
- The MCS label is assigned to all container content
- MCS labels are persistent to a container
