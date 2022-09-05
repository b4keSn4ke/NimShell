# NimShell
A small reverse shell made in NIM, compatible with Windows and Nix.

## Compilation

If you want to compile a Windows and Nix version of the NimShell you can use the `build.sh` script<br>
or if you prefer building for a specific platform you can use the following commands:

#### Compile From Linux to Windows : 
```nim c --app:gui -d:mingw nimshell.nim```

#### Compile From Linux to Linux :
```nim c --app:gui -d:release nimshell.nim```

