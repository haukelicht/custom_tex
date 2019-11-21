# My local TeX classes and styles

This repository contains my custom TeX classes and styles

## How to use

- copy or sym link these files into your texmf/tex/latex/local/ (macOS/Unix) directory
- optionally: read these StackExchange replies to learn how to change the default path of your texmf/ directory: https://tex.stackexchange.com/a/467842 and https://tex.stackexchange.com/a/473173
- use custom classes in your LaTex document with the command `\documentclass[<options>]{<class name>}` (e.g. `\documentclass[linkcolor=blue,biblatex=false]{workingpaper}`)
- use custom styles in your LaTex document with the command `\usepackage[<options>]{<style name>}` (e.g. `\documentclass[narrow]{items}`)