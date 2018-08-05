# `get.darryl.sh`

A portable toolkit; a collection of scripts designed to be invoked remotely for easy access on any Unix-like system.

## Usage

Command | Output
--------|-------
`curl get.darryl.sh` | Print basic usage information
`curl get.darryl.sh/dotfiles | sh` | Installs my [dotfiles](https://github.com/rootbeersoup/dotfiles)
`curl get.darryl.sh/lite | sh` | A minimal Bash configuration; aliases, bindings, etc

## Checksums

Script | SHA-256 Checksum
-------|-----------------
[dotfiles.sh](https://github.com/rootbeersoup/get.darryl.sh/blob/master/src/dotfiles.sh) | `2aa8848937852e4e4e01cf738938dc18edabf86a4b3e2a8a9c29b15b66b7a747`
[lite.bash](https://github.com/rootbeersoup/get.darryl.sh/blob/master/src/lite.bash) | `a109bffa376f23fe4842d7946617c18d9d7412165c5ded18d2bd0c3b4db314d0`

While `curl | sh` is considered an "unsafe" practice by many, we can mitigate risk by validating checksums of the scripts before piping them directly to `sh`. To check the SHA-256 checksum of the dotfiles installer:

```bash
curl get.darryl.sh/dotfiles | shasum -a 256
```
