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
* *1X* - Command Line Augmentations
* *2X* - Version Control
* *3X* - Reserved
* *4X* - Reserved
* *5X* - Virtual Environments (Docker, Python venv, etc.)
* *6X* - Reserved
* *7X* - Programming Language Configuration
* *8X* - Tools (Configurations)
* *9X* - Project configurations
