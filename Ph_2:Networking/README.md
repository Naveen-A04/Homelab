# Phase 2: Networking

## Setup

**Step 1:** Hardened my knowledge on IP addressing, subnetting, DHCP and DNS

Practised subnetting by hand until I could find the network, broadcast address and usable range for a `/24` to `/30` address.

**Step 2:** Checked my own network settings

```
ip a
ip route

```

Found my IP, subnet mask and default gateway, and worked out the network and broadcast address by hand.

**Step 3:** Checked and renewed my DHCP lease

```
ipconfig /all
ipconfig /release
ipconfig /renew

```

Found the DHCP server and lease times, then released and renewed the lease.

**Step 4:** Tested DNS

```
nslookup example.com
dig example.com

```

**Step 5:** Built networks and isolated faults in Packet Tracer

Built two networks joined by a router, then broke one setting at a time (wrong gateway, DHCP off, wrong DNS) and fixed each fault.

**Step 6:** Captured traffic in Wireshark

Filtered on `dhcp` and `dns` and found the four DHCP steps (Discover, Offer, Request, Acknowledge) and a DNS lookup.

**Step 7:** Set up a fixed address for the server

Tried to reserve an address for the server's MAC in my router, then set a static IP directly on the server instead.

## What went wrong

**Problem:** Couldn't set up a DHCP reservation in the router.

**Cause:** The router doesn't allow DHCP reservations.

**Fix:** Configured a static IP directly on the server outside the DHCP pool.

## What I learned

Put networking theory into practice by troubleshooting real connection faults, reading packet captures, and working around router limitations.
