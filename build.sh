#!/bin/bash
nim c --app:gui -d:mingw nimshell.nim
nim c --app:gui -d:release shell.nim