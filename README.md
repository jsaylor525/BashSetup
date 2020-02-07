# BashSetup

This repository helps to created a similar feel on all systems.
To use simply clone the repo and then install configuration.
The `install.sh` script will handle updating your local **.bashrc** so that all the scripts inside the `.bashrc.d` are run.

```bash
. install
```

Once installed you should see the following when a new terminal is opened.
```md
[SUCCESS] - Loaded Functions
[SUCCESS] - Custom git configuration loaded.
```

## Individual scripts
Inside of the `.bashrc.d` all the individual scripts.
The following prefixes and practices should be employeed.

* *0X* - Linux System (networking, memory, cpu, etc.)
* *1x* - Command Line Augmentations
* *2X* - Version Control
* *3x* - Reserved
* *4x* - Reserved
* *5x* - Virtual Environments (Docker, Python venv, etc.)
* *6x* - Reserved
* *7x* - Programming Language Configuration
* *8x* - Reserved
* *9x* - Project configurations
