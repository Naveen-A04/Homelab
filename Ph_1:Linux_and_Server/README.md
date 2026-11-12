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

**Step 4:** Created test users and a shared folder

```bash
sudo adduser bob
sudo groupadd devs
sudo usermod -aG devs bob
sudo mkdir /srv/shared
sudo chown root:devs /srv/shared
sudo chmod 2770 /srv/shared
```

**Step 5:** Managed services with `systemctl` and read SSH logs with `journalctl`

```bash
systemctl status ssh
journalctl -u ssh
```

**Step 6:** Wrote a bash backup script and set up a cron job for nightly backups

`~/backup.sh`:

```bash
#!/bin/bash
tar -czf ~/backups/home-$(date +%F).tar.gz ~/homelab
```

```bash
chmod +x ~/backup.sh
crontab -e
```

```
0 2 * * * /home/youruser/backup.sh
```

## What went wrong

**Problem:** The test users had no home directory.

**Cause:** I created them with `useradd`, which doesn't make a home folder by default.

**Fix:** Recreated them with `adduser`, which creates the home directory automatically.

## What I learned

Put the Linux theory I'd studied into practice on a real server.
