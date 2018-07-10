# Style Guide

## File Extensions

All script files should be appended with the appropriate extension, relaying exactly which interpreter will run the file. e.g. `.sh` extensions should only be for POSIX sh files. `.bash` for Bash, `.py` for Python, etc.

## Language Rules and Code Formatting

### General Rules
* POSIX sh (dash) is the default language for all scripts. This ensures portability as most shells are a superset of sh/dash. If a script is targeting Bash specifically, it's perfectly acceptable to use Bash.
  * Use `shellcheck` to check for POSIX sh-compliance.
* Be mindful of default software versions on targeted OS distributions. e.g. do not target Bash 4.4 for a macOS script, since macOS ships with 3.2.57.
* Indentation and whitespace
  * 2 spaces. Avoid tabs unless necessary.
* Line length
  * 80-100 character maximum encouraged. Not strict.
* Alignment 
  * Alignment for the sake of legibility is strongly encouraged unless functionally inhibitive.
* Comments
  * Commenting is strongly encouraged for the sake of good documentation. Always err on the side of verbosity for comments.

### POSIX sh/dash
* She-bang
  * `#!/bin/sh -e`
  * The `-e` flag provides a safe-guard; it tells sh/dash to exit immediately if an untested command fails

### Bash
* She-bang
  * `#!/usr/bin/env bash`
