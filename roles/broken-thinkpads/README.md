Thinkpad broken chipset fixes
=============================

Several Thinkpads, e.g. W520 and W530 have a bug in the chipset, specifically in the Advanced Programmable Interrupt Controller (x2APIC). (As documented in 2011)[https://bugs.launchpad.net/ubuntu/+source/linux/+bug/776999], setting the parameter `nox2apic` in grub disables Linux from using the x2APIC interface, and thus affected Thinkpads stop crashing.

WARNING: Messes with grub. Only tested on W520 and W530.
