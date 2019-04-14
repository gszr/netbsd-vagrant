## NetBSD on Vagrant

A NetBSD Vagrant environment.

## Base Image

The base image used provides NetBSD 8.0, with the following sets:
- Kernel (GENERIC)
- Kernel modules
- Base
- Configuration files (/etc)
- Compiler Tools
- Manual Pages

Additional sets can be installed as needed - e.g., by [downloading the set][1],
which is a tarball, and extracting it into `/`; for example:
```
tar xvzpf games.tgz -C /
```

## Vagrantfile

Default behavior:
- The current working directory (where the Vagrantfile is) is shared with the
NetBSD VM over NFS, mounted to `/work`
- Unless `NETBSD_MEMORY` is specified, the box will have 4096MB of memory
- Unless `NETBSD_CPUS` is specified, the box will have 8 CPUs

On `vagrant up`, the script `provision.sh` will be executed. Currently, it:
- Installs a few packages, unless a `NETBSD_NO_PACKAGES` environment variable
is passed (with any value)
- Link `/work/src` to `/usr/src` - if `/work/src` exists, it's assumed to be
the NetBSD source tree
- Create `/usr/tools`, `/usr/obj`, and assign permissions over them to the
`vagrant` user
- Set a few useful environment variables in `.profile` (mostly governing
`build.sh` behavior


---

[1]: https://ftp.netbsd.org/pub/NetBSD/NetBSD-8.0/amd64/binary/sets/
