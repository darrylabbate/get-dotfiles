# `get.darryl.cx`

Shell script for downloading the [dotfiles](https://github.com/rootbeersoup/dotfiles) repo, to be invoked with `curl` or `wget`.

## Usage

```bash
$ curl get.darryl.cx | sh
```

```bash
$ wget -qO- get.darryl.cx | sh
```

The script will download the dotfiles repository and place it in `~/dotfiles`. From there, the user is instructed to navigate to the `~/dotfiles` directory to manually invoke the Makefile.

## Checksums

Latest checksums can be found in the [tag notes](https://github.com/rootbeersoup/get-dotfiles/tags)

While `curl | sh` is considered an "unsafe" practice by many, we can mitigate risk by validating checksums of the scripts before piping them directly to `sh`. To check the SHA-256 checksum of the dotfiles installer:

```bash
$ curl get.darryl.cx | shasum -a 256
```
