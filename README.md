# 1password-op.plugin.zsh

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Funixorn%2F1password-op.plugin.zsh%2Fbadge%3Fref%3Dmain&style=plastic)](https://actions-badge.atrox.dev/unixorn/1password-op.plugin.zsh/goto?ref=main)
![Awesomebot](https://github.com/unixorn/1password-op.plugin.zsh/actions/workflows/awesomebot.yml/badge.svg)
![Megalinter](https://github.com/unixorn/1password-op.plugin.zsh/actions/workflows/mega-linter.yml/badge.svg)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [1password-op.plugin.zsh](#1password-oppluginzsh)
  - [Description](#description)
  - [Installation](#installation)
    - [Oh-My-Zsh](#oh-my-zsh)
    - [Zgenom](#zgenom)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Description

1Password has a command line tool, [op](https://developer.1password.com/docs/cli/get-started/), for accessing secrets in your vaults.

This plugin loads the completions for `op` and its subcommands. It has only been tested on `op` version 2.

## Installation

### [Oh-My-Zsh](http://ohmyz.sh/)

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:1password-op.plugin.zsh 1password-op`
3. Add `1password-op` to your plugin list - edit `~.zshrc` and change `plugins=(...)` to `plugins=(... 1password-op)`

### [Zgenom](https://github.com/jandamm/zgenom)

Add `zgenom load unixorn/1password-op.plugin.zsh` to your `.zshrc` file in the same function you're doing your other `zgenom load` calls in. Zgenom will handle automatically cloning the plugin for you the next time you do a `zgenom save`.
