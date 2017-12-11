---
layout: post
title: Running Git bash and Windows cmd.exe in ConEmu
categories: 
tags:
- windows
---

Want to run `Git bash` and `cmd.exe` side by side? You got it.

![Git bash and cmd in ConEmu](/images/2017/12/conemu_git_bash_and_cmd.png)

Download [ConEmu](https://conemu.github.io/), select a startup task:

![ConEmu config](/images/2017/12/conemu_first_start_config.png)

{Shells::cmd} is the Windows `cmd.exe`.
{Bash::Git bash} is `Git Bash`.

Select {Bash::Git bash} for now. You can change it later by: [Settings: Startup](https://conemu.github.io/en/SettingsStartup.html)

Open a new tab for cmd.exe by:

![ConEmu open new tab](/images/2017/12/conemu_open_new_tab.png)

You can also open it as a split (pane) by:

Pressing `Win+W` or `[+]` toolbar button - `New console dialog...` and setting
up `New console split` options.

![ConEnu new console split](/images/2017/12/conemu_new_console_split.png)

Refer to the [documentation for more ways to split panes](https://conemu.github.io/en/SplitScreen.html).

Now you can start to enjoy Windows terminal as never before. ^.^