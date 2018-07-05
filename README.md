## About

This repository is a mirror for the subdomain of my personal site. Currently it contains a single shell script which can be invoked with `curl` to clone and install my [dotfiles](https://github.com/rootbeersoup/dotfiles). This provides the absolute easiest installation method should I have the misfortune of having to set up a new macOS device.

The SHA-256 checksum of the script is `dd15ffb9e85a226d67c4a175518ae3e62f2c513b27d0ecc5093db7a1e9b463c2`

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

## A Note About Directory Structure

My web server is currently configured to use the [`/scripts`](https://github.com/rootbeersoup/get.darryl.sh/tree/master/scripts) directory as the website root. The server is also configured to use `dotfiles.sh` as the index.  All requests to `get.darryl.sh` will point to the `dotfiles.sh` file. If I add more scripts in the future, they'll be accessible at `get.darryl.sh/<script>`.
