# Using Podman 

## What is Podman?

Podman lets you run little isolated boxes/containers on your computer. Each box has its own installed software, separate from your real system. You can install a software inside it without affecting the host machine and when you're done, delete the box and the host is untouched. No leftover files, no clutter. Think of it like a disposable computer-within-a-computer.

Key difference from a VM: a container is much lighter and faster because it shares your computer's actual Linux kernel instead of pretending to be a whole separate machine. That's why containers start in under a second and VMs take way longer.

---

## The three things you'll deal with

1. **Image** — a template. Like a fresh install disc. You never change an image directly.
2. **Container** — a running (or stopped) copy made *from* an image. This is the actual box you use, install stuff in, and can delete.
3. **Volume** — a folder that survives even if you delete the container. Use this if there's something you actually want to keep long-term (not common for lab/throwaway use).

---

## Everyday commands

### Create and enter a new container
```bash
podman run -it archlinux /bin/bash
```
- `-it` means "interactive" — gives you a live terminal inside the box.
- `archlinux` is the image (swap for `kalilinux/kali-rolling`, `alpine`, `ubuntu`, etc.)
- `/bin/bash` is what to run when it starts (a shell, so you can type commands).

This drops you straight inside the container. Type `exit` to leave it.

### See what containers exist
```bash
podman ps -a
```
`-a` shows ALL containers, not just running ones (stopped ones still exist until deleted).

### See what's currently running
```bash
podman ps
```

### Go back into a container you already made (instead of making a new one)
```bash
podman start -ai container-name
```

### Stop a running container
```bash
podman stop container-name
```

### Delete a container completely
```bash
podman rm container-name
```
If it complains about it still being active, force it:
```bash
podman rm -f container-name
```

### Delete an image (the template itself, frees more space)
```bash
podman rmi image-name
```

---

## Checking how much space everything is using

```bash
podman system df
```
Quick summary: images, containers, volumes, and how much each is costing you in disk space.

Add `-v` for a detailed breakdown of every individual item:
```bash
podman system df -v
```

---

## Cleaning up / reclaiming space

Delete one container:
```bash
podman rm -f container-name
```

Nuke everything unused at once (stopped containers, unused images, leftover build junk):
```bash
podman system prune -a
```
This is the "clean slate" button. Only removes stuff that isn't actively running.

---

## Naming containers so you don't lose track

By default, containers get random names. Give it a name yourself when creating it, so it's easy to tell your throwaway lab containers apart from anything important:
```bash
podman run -it --name kali-lab kalilinux/kali-rolling /bin/bash
```
Now you can refer to it as `kali-lab` in every command instead of a random ID.

---

## Saving your setup so you can rebuild it later

Containers themselves aren't meant to be permanent — the trick is saving *what you did* so you can recreate it fast.

**Easiest way:** just write down the `podman run` command you used, in a text file. To rebuild, paste that same command again later.

**If you installed a bunch of packages inside and want a list of them (Arch-based container):**
```bash
pacman -Qqe > ~/my-packages-list.txt
```
Run this *inside* the container. It saves a list of everything you installed. Later, reinstall them all in one line:
```bash
sudo pacman -S --needed - < ~/my-packages-list.txt
```

---

## Distrobox

Distrobox is a friendlier wrapper around Podman, meant for using a container like a regular development environment (not just a quick throwaway box).

Enter a Distrobox container:
```bash
distrobox enter dev
```

Rename the underlying container:
```bash
podman rename old-name new-name
```

Everything else (stopping, deleting, checking space) works exactly the same as regular Podman commands, since Distrobox containers ARE Podman containers underneath.

---

## Quick mental model to remember

- **Image** = installer disc (don't touch it directly)
- **Container** = the actual computer you use (safe to delete anytime)
- **Volume** = the one folder that survives deletion (only if you set one up)
- **`podman system df`** = "how much space is this costing me"
- **`podman system prune -a`** = "clean everything up"
- **`podman rm -f name`** = "delete this one container"

** Distrobox and how it uses Podman**
Regular Podman containers are isolated from your real system by default — nothing inside touches your actual files unless you manually mount a folder in with `-v`. Distrobox does the opposite on purpose: when you create a Distrobox container, it automatically mounts your entire home folder in. That means files inside a Distrobox container ARE your real files — not a separate copy. This is intentional, since Distrobox is meant to feel like an extension of your host system, not a sandboxed box.
