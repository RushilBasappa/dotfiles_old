# Rushil's dotfiles

## Installation

**Warning:** Before using these dotfiles, review the code and remove the parts which are not required. Do not use any setting unless you know the result of it. Dont blindly copy the files. Use at your own risk!

### Using Git and the install script

You can clone the repository anywhere you want as the script file creates symlinks of the repo in your home directory. (I'd prefer to keep it in '~/dotfiles')

```bash
#!/bin/bash
git clone https://github.com/RushilBasappa/dotfiles.git && cd dotfiles
chmod 744 bootstrap.sh
make install
```

## Post Installation

- Update user, email in `gitconfig`
