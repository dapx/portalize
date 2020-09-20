# Portalize

A simple shell alias to make portals 🧙

![Runescape tablet teleport animation](https://oldschool.runescape.wiki/images/1/1a/Teleport_Tablet.gif)

## How it works?

It's a very simple alias that allows you to create alias for your current directory.

Several times we need to go from a different directory path to another as well as when you change the project that you are working, or needs to go working on a very deep directory path.

We make it easy to you with `portalize`.

## Install

Execute on your shell:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/dapx/portalize/master/install.sh)"
. ~/.portals # Load portals after install, or you can simply start a new shell session.
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

## How to list portals

Call the `portals` alias and it will list all portals ordered by creation:

```sh
portals
```

You can also compose with `sort` to list all portals ordered by name:

```sh
portals | sort
```

## How to remove portals

Call the `unportalize` alias from any place passing the alias name that you want to remove:

```sh
unportalize aliasname
```

## How to uninstall

Remove the portal alias file load command from your rc file:

```sh
printf "%s\n" "g/^\. ~\/\.portals$/d" w | ed -s ~/.$(basename $SHELL)rc
```

And if don't want to maintain your portals saved, you can simply remove the `~/.portals` file:

```sh
rm ~/.portals
```
