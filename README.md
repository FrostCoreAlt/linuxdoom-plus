# LinuxDoom+
LinuxDoom+ is a source port based on LinuxDoom v1.10, it is aimed at vanilla compatibility while adding new features
# Credits
Fork of idSoftware/DOOM (linuxdoom-1.10), uses modified code from SDLDoom to work on SDL2.
# Compiling
You need to have sdl2, sdl2_mixer, and sdl2_net, you can install these in whatever linux distro you have, if you are using Windows, there soon will be instructions on setting up a compiling environment,

Example: on Arch Linux

```sudo pacman -S sdl2 sdl2_mixer sdl2_net```

Then, clone the repository, and type

```make```

The output will be in the ```linux/``` folder
# Features
SDL Renderer

SDL Sounds

Support for DOOM (registered and shareware), The Ultimate DOOM, DOOM II, DOOM II: TNT: Evilution, DOOM II: The Plutonia Experiment, Freedoom: Phase 1, Freedoom: Phase 2, DOOM II: L'Enfer sur Terre (french DOOM II, limited support)
# Bugs
None so far.
# Screenshots
![DOOM II Main Menu on LinuxDoom+](scrshot.png)
![DOOM II Demo playing on LinuxDoom+](scrshot2.png)
# TODO
Windows port (finish cross platform make as compiling currently does support Windows
