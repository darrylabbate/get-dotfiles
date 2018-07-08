## About

This repository is a mirror for the subdomain of my personal site. Currently it contains a single shell script which can be invoked with `curl` to clone and install my [dotfiles](https://github.com/rootbeersoup/dotfiles). This provides the absolute easiest installation method should I have the misfortune of having to set up a new macOS device.

The SHA-256 checksum of the script is `7e2969ffe048237451b48bb23adc80e3729f5d7c6d0635f22d5bd1baa907e2eb`

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

### A Note About Directory Structure

My web server is currently configured to use the [`/scripts`](https://github.com/rootbeersoup/get.darryl.sh/tree/master/scripts) directory as the website root. The server is also configured to use `dotfiles.sh` as the index.  All requests to `get.darryl.sh` will point to the `dotfiles.sh` file. If I add more scripts in the future, they'll be accessible at `get.darryl.sh/<script>`.
