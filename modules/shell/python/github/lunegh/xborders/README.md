# xborders
Active window border replacement for window managers, now with fading borders for a cleaner look.

## Usage
**Install with pipx (recommended)**
```sh
pipx install git+https://github.com/lunegh/xborders
xborders --help
```
**Or clone the repository**
```sh
git clone https://github.com/lunegh/xborders
cd xborders
pip install -r requirements.txt
chmod +x xborders
./xborders --help
```

### Dependencies
Make sure to install dependencies first! `pip install -r requirements.txt`

**Python dependencies**
* pycairo (Tested with version 1.27.0)
* requests (Tested with version 2.32.3)
* pygobject (Tested with version 3.50.0)
* zc.lockfile (Tested with version 3.0.post1)
* python-xlib (Tested with version 0.33)

**System dependencies**
* libwnck (Tested with version 40.1-1, Arch: `sudo pacman -S libwnck3` Debian: `sudo apt install libwnck-3-0` NOTE: may need 'libwnck-3-0-dev' for Debian)
* gtk
* a compositor that supports transparent windows ([picom](https://github.com/yshui/picom) is what I am using)

Manually installing **Python dependencies** is **not required when installing with pipx**.

### Recommended Dependencies
* libnotify (Debian: `sudo apt install libnotify-bin` Arch: `sudo pacman -S libnotify`)

### Note for compositor
If you don't want your entire screen blurred please add `role = 'xborder'` to your blur-exclude!
```
blur-background-exclude = [
  # prevents picom from blurring the background
  "role   = 'xborder'",
  ...
];
```

## xborders on top of i3:
![image](https://user-images.githubusercontent.com/82973108/160370439-8b7a5feb-c186-4954-a029-b718b59fd957.png)
## i3 default:
![image](https://user-images.githubusercontent.com/82973108/160370578-3ea7e3e9-723a-4054-b7b0-2b0110d809c0.png)

### Config
Configuration options can be found by passing in the argument `--help` on the command line, or by specifying a config file with the argument `-c`. If no config file is specified with the `-c` argument, xborders will look for one at ~/.config/xborders/xborders.json. However, it will not create the file if it is missing.

The config file is just a simple json file with the keys being the same as the command-line arguments (except without the "--" at the beginning).
# Updating
**For pipx installations**

```sh
pipx upgrade xborders
```
**For manual installations**

```sh
cd /path/to/xborders
git pull origin main
pip install -r requirements.txt
```
