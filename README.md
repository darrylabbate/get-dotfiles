## About

This repository is a mirror for the subdomain of my personal site. It contains a single shell script which can be invoked with `curl` to clone and install my [dotfiles](https://github.com/rootbeersoup/dotfiles). This provides the absolute easiest installation method should I have the misfortune of having to set up a new macOS device.

The SHA-256 checksum of the script is `64cd014f0c789db8cbc351873620c249f0000c39d485dc0d7db570550ec73666`

You can (and should) verify the SHA-256 checksum before downloading. This can be done via `shasum -a 256`

```bash
curl get.darryl.sh | shasum -a 256
```

Once you verify the script, you can proceed to download

```bash
curl get.darryl.sh | sh
```


## How it Works

The script itself is fairly concise; It simply:

* Installs git
* Clones the [dotfiles](https://github.com/rootbeersoup/dotfiles) repository
* Invokes the [`Makefile`](https://github.com/rootbeersoup/dotfiles/blob/master/Makefile)
