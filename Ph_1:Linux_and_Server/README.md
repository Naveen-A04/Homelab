# Phase 1: Linux and server

## Setup

**Step 1:** Updated the VM and the server

```bash
sudo apt update && sudo apt upgrade
```

**Step 2:** Set up SSH keys from the VM to the server

```bash
ssh-keygen -t ed25519
ssh-copy-id youruser@server-ip
```

Then turned off password login with `PasswordAuthentication no` in `/etc/ssh/sshd_config` and restarted SSH.

**Step 3:** Set up the firewall to allow SSH

```bash
sudo ufw allow 22/tcp
sudo ufw enable
```

