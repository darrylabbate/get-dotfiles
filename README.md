# `get.darryl.sh`

A portable toolkit; a collection of scripts designed to be invoked remotely for easy access on any Unix-like system.

## Usage

Command | Output
--------|-------
`curl get.darryl.sh` | Print basic usage information
`curl get.darryl.sh/dotfiles \| sh` | Install [dotfiles](https://github.com/rootbeersoup/dotfiles)
`curl get.darryl.sh/lite \| sh` | Source a minimal Bash configuration

## Checksums

Script | SHA-256 Checksum
-------|-----------------
[dotfiles.sh](https://github.com/rootbeersoup/get.darryl.sh/blob/master/src/dotfiles.sh) | `5e235d8c44c5f3eab3f04d999281349cde47b34d26328293b66b4325f815de62`
[lite.bash](https://github.com/rootbeersoup/get.darryl.sh/blob/master/src/lite.bash) | `a109bffa376f23fe4842d7946617c18d9d7412165c5ded18d2bd0c3b4db314d0`

While `curl | sh` is considered an "unsafe" practice by many, we can mitigate risk by validating checksums of the scripts before piping them directly to `sh`. To check the SHA-256 checksum of the dotfiles installer:

```bash
curl get.darryl.sh/dotfiles | shasum -a 256
```
