# BashSetup

This repository helps to created a similar feel on all systems.
To use simply clone the repo and then install configuration.
The `install.sh` script will handle updating your local **.bashrc** so that all the scripts inside the `.bashrc.d` are run.

Developers who might find this useful.
- FPGA Developers
- Embedded SW Developers
- Other developers who are will to fork and twick for their purposes.

```bash
. install
```

Once installed you should see the following when a new terminal is opened.
```md
[SUCCESS] - Loaded Functions
[SUCCESS] - Custom git configuration loaded.
... etc
```

## Customization
The following variables can be used to alter the behavior if exported in your `~/.bashrc`
* **USE_COLORS** - setting this to any value will enable color functions
    + *WARNING There seems to be a bug with this currently!*
* **LOG_LEVEL** - setting this to an integer value between 1 and 5 change the level of logs to the terminal
    + 1 being the quietest (ERROR) and 5 being the most verbose (VERBOSE).
* **GITPROMPT** - allows the choice of the gitprompt
    + *bash-git-prompt* - a gitprompt by [magicmonty](https://github.com/magicmonty/bash-git-prompt.git)
    + *basic* - a custom lightweight prompt that simply tells what the current working branch is
* **USE_ANACONDA** - set this to any value to configure conda
* **JAVA_DEV** - set this to configure java settings
* **USE_OCTAVE** - set this to configure octave settings
* **USE_XILINX** - set this to configure xilinx settings
* **DEFAULT_PYTHON_VER** - allows the default python version to be used with shorthand `python` an `py`
    + default to python3
* **BCOMPARE_ENABLED** - if you want to use beyond compare as your default diff and merge tool

## Individual scripts
Inside of the `.bashrc.d` all the individual scripts.
The following prefixes and practices should be employeed.

* *0X* - Linux System (networking, memory, cpu, etc.)
* *1X* - Command Line Augmentations
* *2X* - Version Control
* *3X* - Reserved
* *4X* - Reserved
* *5X* - Virtual Environments (Docker, Python venv, etc.)
* *6X* - Reserved
* *7X* - Programming Language Configuration
* *8X* - Tools (Configurations)
* *9X* - Project configurations
