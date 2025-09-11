# LinuxDoom+
LinuxDoom+ is a source port based on LinuxDoom v1.10, it is aimed at vanilla compatibility while adding new features
# Credits
Fork of idSoftware/DOOM (linuxdoom-1.10), uses renderer and sound code by Sam Lantinga (modified and copied from SDLDoom!)
# Compiling
## NOTE: This code only compiles on Linux, a Windows build is not planned for now
You need to have nsl and sdl12-compat, you can install these in whatever linux distro you have,

Example: on Arch Linux

```sudo pacman -S sdl12-compat libnsl sdl_mixer```

Then, clone the repository, and type

```make```

The output will be in the ```linux/``` folder
# Features
SDL Renderer

SDL Sounds

Support for DOOM (registered and shareware), The Ultimate DOOM, DOOM II, DOOM II: TNT: Evilution, DOOM II: The Plutonia Experiment, Freedoom: Phase 1, Freedoom: Phase 2, DOOM II: L'Enfer sur Terre (french DOOM II, limited support)
# Bugs
Game crashes when trying to quit multiple times

Sample rate is predefined as 11,205 Hz so some sounds that have 11,205 Hz (like the super shotgun reload) play at half speed
# Screenshots
![DOOM II Main Menu on LinuxDoom+](scrshot.png)
![DOOM II Demo playing on LinuxDoom+](scrshot2.png)
# TODO
Fix all bugs previously mentioned.

Windows port (that is up to you contributors, I have tried myself and failed)
