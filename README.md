# Paradox

Game designed around the anime/manga Heavenly Delusion
Built with [Rojo](https://github.com/rojo-rbx/rojo), [ProfileStore](https://github.com/MadStudioRoblox/ProfileStore), [Promise](https://github.com/evaera/roblox-lua-promise), and [Cmdr](https://github.com/evaera/Cmdr). All installed through [Wally](https://github.com/UpliftGames/wally) using [rokit](https://github.com/rojo-rbx/rokit)

## Build

First, ensure rojo, rokit, and optionally wally-package-types are installed

```bash
rokit install
wally install
rojo sourcemap --output sourcemap.json --include-non-scripts # Optional
wally-package-types --sourcemap sourcemap.json Packages/ ServerPackages/ # Optional
rojo serve
```
