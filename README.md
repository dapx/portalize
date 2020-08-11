# portalize

A simple shell alias to make portals 🧙

![Runescape tablet teleport animation](https://oldschool.runescape.wiki/images/1/1a/Teleport_Tablet.gif)

## How it works?

It's a very simple alias that allow you to create alias for your current directory.

Several times we need to go from a different directory path to another as well as when you change the project that you are working, or needs to go working on a very deep directory path.

We make it easy to you with portalize.

## Install

Execute on your shell:

```sh
git clone git@github.com:dapx/portalize.git
cd portalize
chmod +x install.sh
./install.sh
source ~/.$(basename $SHELL)rc
```

## How to create portals?

Create a portal is easy peasy:

```sh
cd project/directory
portalize aliasname
```

After that you can call the alias from any place:

```sh
aliasname
```

And you will be teleported to there.

## How to remove portals

Call the unportalize alias from any place passing the alias name that you want to remove:

```sh
unportalize aliasname
```

## How to uninstall

Very simple too:

```sh
unportalize portalize
unportalize unportalize
```
