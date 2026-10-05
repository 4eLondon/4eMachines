<div align="center">

# ✦ 4eArch-Openbox ✦

<img src="https://img.shields.io/badge/ARCH%20LINUX-1793D1?style=for-the-badge&logo=archlinux&logoColor=white" alt="Arch Linux">
<img src="https://img.shields.io/badge/OPENBOX-5BC8F5?style=for-the-badge&logoColor=white" alt="Openbox">

</div>

---

## Screenshots

| Preview |
| :---: |
| <img src="Outer01_a.png" alt="Outer01_a" width="800"> |
| <img src="Outer01_b.png" alt="Outer01_b" width="800"> |
| <img src="Outer01_c.png" alt="Outer01_c" width="800"> |

---

## Host Requirements

- QEMU with KVM support (`qemu-system-x86_64`)
- A GPU and driver stack that supports virgl (`virtio-vga-gl` with OpenGL display)
- A network bridge named `vmbr0` on the host
- `qemu-bridge-helper` permitted to use that bridge, by adding this line to `/etc/qemu/bridge.conf`:

```
allow vmbr0
```

---

## Building the Image

1. Create a blank raw disk image (adjust the size as needed):

```bash
mkdir -p ~/Documents/Misc/machines
qemu-img create -f raw ~/Documents/Misc/machines/outer01.img 40G
```

2. Boot the Arch Linux installer ISO against the image:

```bash
qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -cpu host \
  -drive file=~/Documents/Misc/machines/outer01.img,format=raw \
  -cdrom ~/Downloads/archlinux-x86_64.iso -boot d \
  -device virtio-vga-gl -display gtk,gl=on \
  -netdev bridge,id=net0,br=vmbr0 -device virtio-net-pci,netdev=net0
```

3. Install the base system onto the disk (`archinstall` or a manual install), including `base`, `linux`, `linux-firmware`, `grub`, `sudo`, `git` and `openssh`.

4. Reboot into the installed system, log in, then clone this repository and run the setup script:

```bash
git clone <repository-url>
cd arch_abyssbox
chmod +x master_setup.sh
./master_setup.sh
```

The script installs the packages listed below and applies the configuration in `.config`, the colors and the effects.

---

## Running the Machine

Add this alias to your shell configuration on the host:

```bash
alias a1='sleep 5s ; qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -cpu host -drive file=~/Documents/Misc/machines/outer01.img,format=raw -device virtio-vga-gl -display gtk,gl=on -netdev bridge,id=net0,br=vmbr0 -device virtio-net-pci,netdev=net0 & disown'
```

Then start the machine with:

```bash
a1
```

| Option | Meaning |
| :--- | :--- |
| `-enable-kvm` | Hardware acceleration through KVM |
| `-m 4G` | 4 GB of RAM |
| `-smp 2` | 2 virtual CPU cores |
| `-cpu host` | Pass the host CPU model through |
| `-drive file=...,format=raw` | The raw disk image `outer01.img` |
| `-device virtio-vga-gl` | Virtio GPU with OpenGL acceleration |
| `-display gtk,gl=on` | GTK window with OpenGL enabled |
| `-netdev bridge,...` | Bridged networking on `vmbr0` |
| `-device virtio-net-pci` | Virtio network card |

---

## Repository Contents

| File | Purpose |
| :--- | :--- |
| `master_setup.sh` | Main setup script |
| `outer_colors.sh` | Color configuration script |
| `outer_effects.sh` | Effects configuration script |
| `outer_wall_1.jpg` | Wallpaper 1 |
| `outer_wall_2.jpg` | Wallpaper 2 |
| `.config/` | Configuration files |

---

## Packages

| Package | Version |
| :--- | :--- |
| alacritty | 0.17.0-1 |
| base | 3-3 |
| bat | 0.26.1-3 |
| btop | 1.4.7-1 |
| clipmenu | 6.2.0-3 |
| eza | 0.23.5-2 |
| feh | 3.13.1-1 |
| firefox | 157.0-1 |
| fzf | 0.74.4-1 |
| git | 2.56.0-1 |
| git-delta | 0.20.1-1 |
| grub | 2:2.16-1 |
| imv | 5.0.1-2 |
| linux | 7.2.8.arch1-2 |
| linux-firmware | 20260916-1 |
| ly | 1.4.1-1 |
| maim | 5.8.2-1 |
| man-db | 2.13.1-2 |
| man-pages | 6.19-1 |
| mesa | 1:26.2.4-1 |
| mesa-utils | 9.0.0-7 |
| mkinitcpio | 42.2-1 |
| mpv | 1:0.41.0-6 |
| nemo | 6.6.4-1 |
| neovim | 0.12.5-1 |
| obconf-qt | 0.16.6-1 |
| openbox | 3.6.1-14 |
| openssh | 10.5p1-1 |
| pfetch-rs | 3.0.0-1 |
| rofi | 2.0.0-1 |
| slop | 7.7-4 |
| sudo | 1.9.17.p2-6 |
| tint2 | 17.0.2-7 |
| ttf-dejavu | 2.37+18+g9b5d1b2f-8 |
| ttf-profont-nerd | 3.5.1-2 |
| ufw | 0.36.2-7 |
| vulkan-radeon | 1:26.2.4-1 |
| xclip | 0.13-6 |
| xdg-user-dirs | 0.20-1 |
| xdg-utils | 1.2.1-2 |
| xdotool | 4.20260303.1-1 |
| xf86-video-amdgpu | 25.0.0-1 |
| xf86-video-ati | 1:22.0.0-3 |
| xorg-server | 21.1.24-1 |
| xorg-xinit | 1.4.4-1 |
| xorg-xset | 1.2.6-1 |
| xorg-xsetroot | 1.1.4-1 |
| xterm | 411-1 |
| yazi | 26.9.1-2 |

---

## Installation

```bash
git clone <repository-url>
cd arch_outer01
chmod +x master_setup.sh
./master_setup.sh
```
