# Advent of code 2023 🎄🌟

☃️ Diving into [Advent of Code (AoC)](https://adventofcode.com/2023) 23 with Erlang. ☃️

## Table of content
- [Advent of code 2023 🎄🌟](#advent-of-code-2023-)
  - [Table of content](#table-of-content)
  - [Description](#description)
  - [Set-up](#set-up)
  - [Documentation](#documentation)


## Description

📅 Advent of Code (AoC) is an annual online challenge that unfolds throughout December. It comprises daily programming puzzles, with participants solving a new set of two puzzles each day until Christmas, earning ⭐ 1 stars ⭐ for each successful solution. The goal is to amass 50 stars to save Christmas!

```
         |
        -+-
         A
        /=\               /\  /\    ___  _ __  _ __ __    __
      i/ O \i            /  \/  \  / _ \| '__|| '__|\ \  / /
      /=====\           / /\  /\ \|  __/| |   | |    \ \/ /
      /  i  \           \ \ \/ / / \___/|_|   |_|     \  /
    i/ O * O \i                                       / /
    /=========\        __  __                        /_/    _
    /  *   *  \        \ \/ /        /\  /\    __ _  ____  | |
  i/ O   i   O \i       \  /   __   /  \/  \  / _` |/ ___\ |_|
  /=============\       /  \  |__| / /\  /\ \| (_| |\___ \  _
  /  O   i   O  \      /_/\_\      \ \ \/ / / \__,_|\____/ |_|
i/ *   O   O   * \i
/=================\
       |___|
```

## Set-up

1. Install [asdf](https://asdf-vm.com/).
2. Use ``asdf install`` to install the versions specified in ``.tool-versions``.
3. Run ``rebar3 shell`` to start an interactive shell with the compiled ``/src/*.erl``.
4. Then choose the puzzle and specifies the input: ``day1:part1(<<"inputs/day1_input.txt">>).``

## Documentation

To generate documentation, use the command: ```rebar3 ex_doc```, this command will generate a doc folder containing HTML documentation files.
