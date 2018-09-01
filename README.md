# `get.darryl.sh`

Shell script for remotely installing [dotfiles](https://github.com/rootbeersoup/dotfiles), to be invoked with `curl` or `wget`.

## Usage

```bash
$ curl get.darryl.sh | sh
```

```bash
$ wget -qO- get.darryl.sh | sh
```

Read the prompt and choose between full installation or symlink-only installation.

## Checksums

Algorithm | Checksum
----------|---------
MD5       | `ea534914c41f6987b38306148f74c2a4`
SHA-1     | `d5708ca1db124027f911b78661941b359cc05ebb`
SHA-256   | `63e5f7771799dac27d83884accd4ebf8d3d602ef3343e0880258537020be4068`


While `curl | sh` is considered an "unsafe" practice by many, we can mitigate risk by validating checksums of the scripts before piping them directly to `sh`. To check the SHA-256 checksum of the dotfiles installer:

```bash
curl get.darryl.sh/dotfiles | shasum -a 256
```
