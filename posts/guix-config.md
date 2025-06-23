title: 👽 GNU Guix Configuration
date: 2025-06-23 23:12
tags: projects
summary: Guix Configuration
---
Guix Config - My GNU Guix Configuration
---

# 💡 Welcome to the **Guix Config** 

> Some files included here are forked from other projects, such as MPV shaders, Simple History, and Cmus themes.

This configuration defines a **secure**, **high-performance**, and **minimalist** GNU Guix system for the host **"securityops"**, tailored for:
- 🧠 **AMD Ryzen 3 2200G** CPU (4 cores, 8 threads)
- 🎮 **Radeon RX 5600/5700 Series** GPU
- 🌐 **Privacy-focused** networking with Mullvad VPN (WireGuard) and Tor
- 🖼️ **Xmonad** tiling window manager with Rofi launcher
- 🎥 **Multimedia** optimized for hardware-accelerated playback (MPV, VLC)
- 🎮 **Gaming** with Steam and Proton
- 🌍 **Japanese input** via Fcitx5 and extensive font support (Iosevka, Noto)
- 🐳 **Containerization** with Docker and virtualization via QEMU
- 🔒 **Security** with strict NFTables firewall, kernel lockdown, and Firejail

With [**XMonad**](https://xmonad.org) as the tiling window manager, a **custom [XanMod kernel**](https://xanmod.org/), and a curated set of packages and services, this setup balances **performance**, **security**, and **aesthetics** for gaming (Steam), privacy (Mullvad VPN, Tor), development workflows, and Japanese input support.


## 📝 Summary

This GNU Guix configuration delivers a privacy-first, high-performance system optimized for an AMD Ryzen 3 2200G and Radeon RX 5600/5700 Series GPU. Powered by the `linux-xanmod` kernel, it includes AMD-specific tuning, 4GB zswap with zstd compression, and BBR networking for efficiency. Xmonad, paired with Rofi and Xmobar, provides a lightweight tiling desktop. Mullvad VPN and Tor ensure secure, anonymous networking, enforced by a strict NFTables firewall. Japanese input via Fcitx5 with Anthy and extensive fonts (Iosevka, Noto) enhance usability. The system supports gaming (Steam, Proton), torrenting (qBittorrent), multimedia (MPV, VLC), and development (GCC, Rust, Emacs). Docker and QEMU enable containerization and virtualization, though Libvirt is temporarily disabled due to a derivation error. Custom channels ([`small-guix`](https://codeberg.org/fishinthecalculator/small-guix.git), [`ajattix`](https://git.ajattix.org/hashirama/ajattix.git), [`radix`](https://codeberg.org/anemofilia/radix.git)) add flexibility, with detailed comments ensuring maintainability.


# ⚙️ Optimized For

- ✅ **GPU Performance**: Tuned AMDGPU drivers with Mesa for gaming and rendering.
- ✅ **CPU Efficiency**: XanMod kernel with AMD P-state, full preemption, and all 8 threads enabled for maximum responsiveness.
- ✅ **Security**: Strict NFTables firewall, Tor, and kernel hardening.
- ✅ **Privacy**: Mullvad VPN and privacy-focused browsers (Tor Browser, Icecat, Zen Browser).
- ✅ **Data Integrity**: Safe ext4 journaling and zRAM swap.
- ✅ **Aesthetics**: Custom GRUB theme and XMonad with Polybar/Xmobar.

## 📸 Screenshots
![best os](/images/amazing.png)
![red dead](/images/game.png)
![amazing term](/images/wezterm.png)

## ✨ Key Features

### **Privacy**:
  - All traffic routed through Mullvad VPN via WireGuard (`wg0-mullvad`).
  - Tor configured for transparent proxying (SOCKS 9050, TransPort 9040).
  - DNS locked to Mullvad’s servers (100.64.0.23).
  - Anti-spoofing and logging in NFTables firewall.

### **Security**:
  - Kernel hardened with `module.sig_enforce=1`, `lockdown=confidentiality`, and `mitigations=auto`.
  - USB devices disabled by default (`usbcore.authorized_default=0`) with Udev rules for trusted devices.
  - Firejail for application sandboxing and ClamAV for antivirus scanning.

### **Performance**:
  - AMD-specific tuning: `amdgpu.ppfeaturemask=0xffffffff`, `amd_pstate=active`, `schedutil` governor.
  - Zswap with zstd compression (4GB) for efficient memory management.
  - BBR TCP congestion control and fq_codel for optimized networking.
  - Hardware-accelerated video decoding (VAAPI) and rendering (Mesa, Vulkan).

### **Functionality**:
  - Xmonad with Rofi for a lightweight, tiling desktop.
  - Japanese input via Fcitx5 with Anthy, supporting GTK/Qt applications.
  - Extensive font support for coding (Iosevka) and CJK scripts (Noto, Source Han Sans).
  - Gaming with Steam, Proton, and Mangohud for performance overlays.
  - Torrenting with qBittorrent and firewall rules for ports 6881-6890.

### **Maintainability**:
  - Declarative Guix configuration for reproducibility.
  - Custom channels (`small-guix`, `ajattix`, `radix`) for Mullvad, dictionaries, and more.
  - Detailed comments in `config.scm` for easy updates.


## 🧠 Kernel Configuration

The system uses the **XanMod kernel** with optimized `kernel-arguments` for **performance**, **security**, and **stability**. All 8 threads of the Ryzen 3 2200G are enabled for maximum multithreaded performance. Below is a detailed table explaining each kernel argument in simple terms.


## ⚖️ OS Comparison

### Explanations
- **Package Management**: GNU Guix’s declarative, functional approach ensures precise control and rollbacks, earning 5 stars. Arch’s rolling updates and Fedora’s DNF are flexible but less predictable. Debian and Ubuntu’s apt is stable but less dynamic. Windows relies on manual or third-party tools (e.g., winget, Chocolatey), lacking system integration.
- **Reproducibility**: Guix’s bit-for-bit reproducible builds are unmatched, guaranteeing identical systems. Debian offers partial reproducibility, while Arch, Fedora, Ubuntu, and Windows have minimal to no reproducibility due to proprietary components or non-deterministic updates.
- **Free Software**: Guix’s 100% FSF-approved software aligns with your ethical goals, earning 5 stars. Debian and Fedora are mostly free but include some non-free firmware. Arch and Ubuntu often incorporate proprietary components. Windows is fully proprietary, scoring 1 star.
- **Declarative Config**: Guix’s Scheme-based `config.scm` unifies system configuration, unlike the manual configs of Arch, Debian, Fedora, Ubuntu, and Windows, which rely on disparate tools or GUI settings.
- **Privacy**: Your Guix setup with Mullvad VPN, Tor, and NFTables provides superior privacy. Arch and Debian are configurable but require manual setup. Fedora is moderate, Ubuntu’s telemetry weakens its privacy, and Windows’ extensive telemetry and data collection make it the weakest.
- **Security**: Guix’s kernel hardening (`lockdown=confidentiality`, `usbcore.authorized_default=0`), Firejail, and NFTables excel. Arch is highly configurable, Fedora uses SELinux, Debian is stable but slower to patch, Ubuntu’s AppArmor is less robust, and Windows relies on frequent updates and antivirus but is vulnerable to exploits.
- **Performance**: Guix’s `linux-xanmod` kernel with AMD tuning (`amd_pstate`, `amdgpu.dpm`), zswap, and BBR optimizes your Ryzen 3 2200G and Radeon RX 5600/5700. Arch and Fedora offer high performance with manual tuning, Debian and Ubuntu are less optimized, and Windows provides strong performance with good AMD driver support but is bloated.
- **Learning Curve**: Ubuntu and Windows are the easiest to learn, followed by Debian and Fedora. Guix and Arch have steeper curves due to advanced customization (Scheme for Guix, manual setup for Arch).

### Best OS: GNU Guix
GNU Guix is the best OS for your `securityops` system, earning 5 stars in most categories due to its alignment with your priorities:
- **Reproducibility and Free Software**: Bit-for-bit builds and 100% free software ensure transparency and consistency, critical for your ethical and reproducible setup, far surpassing Windows’ proprietary nature.
- **Privacy and Security**: Mullvad VPN, Tor, strict NFTables, and kernel hardening provide unmatched protection, outperforming Windows’ telemetry-heavy approach, Ubuntu’s weak defaults, and even Arch’s manual configuration.
- **Performance**: AMD-specific optimizations, zswap, and BBR make Guix ideal for your hardware and use cases (gaming, torrenting, development), rivaling Windows’ driver support but with less overhead.
- **Declarative Config**: The unified `config.scm` simplifies maintenance compared to other OSes’ fragmented configs or Windows’ GUI-based settings.
While Guix’s learning curve is steep, its benefits in privacy, security, performance, and reproducibility make it the superior choice for your tailored, high-performance system, especially compared to Windows’ lack of free software, poor privacy, and non-reproducible nature.

## 🌟 Final Considerations: Why GNU Guix is Better

GNU Guix is the optimal choice for the `securityops` system due to its unparalleled strengths in reproducibility, free software, and declarative management, tailored to your privacy, security, and performance needs:

1. **Reproducibility**: Guix’s bit-for-bit reproducible builds ensure the system can be recreated identically, unlike Arch or Fedora, where manual setups vary. This guarantees consistency for your AMD Ryzen and Radeon setup.

2. **Free Software**: As an FSF-approved distribution, Guix uses 100% free software, avoiding proprietary blobs in Ubuntu or Fedora. This aligns with your ethical goals and ensures full system transparency.

3. **Declarative Configuration**: The Scheme-based `config.scm` unifies kernel, services, and packages in one file, simplifying maintenance compared to Debian’s scattered configs or Arch’s manual tweaks.

4. **Privacy and Security**: Guix enables seamless integration of Mullvad VPN, Tor, and NFTables, surpassing Ubuntu’s weak privacy defaults or Fedora’s SELinux focus. Kernel hardening (`lockdown=confidentiality`, `usbcore.authorized_default=0`) and Firejail provide robust protection for your hardware.

5. **Performance**: Guix’s custom `linux-xanmod` kernel with AMD tuning (`amd_pstate`, `amdgpu.dpm`), 4GB zswap, and BBR networking optimizes your Ryzen 3 2200G and Radeon RX 5600/5700. Unlike Arch’s manual tuning, Guix automates these optimizations declaratively.

6. **Customizability**: Custom channels (`small-guix`, `ajattix`) provide niche packages (Mullvad, Japanese dictionaries), offering Arch-like flexibility with better reproducibility. This supports your diverse needs (gaming, development, multimedia).

7. **Community-Driven**: Guix’s community prioritizes user empowerment and free software, unlike Ubuntu’s corporate influence or Fedora’s Red Hat backing, ensuring alignment with your long-term goals.

Despite a steeper learning curve, Guix’s benefits make it unmatched for a privacy-focused, high-performance system like `securityops`, offering control, security, and ethics that other OSes can’t match.

## 🎥 Guix on YouTube
- 📺 [YouTube: @securityops](https://youtube.com/@securityops)

## 📜 Code
- [Codeberg](https://codeberg.org/berkeley/guix-config)
- [Github](https://github.com/cristiancmoises/guix-config)

This configuration is licensed under the **GNU General Public License v3.0**. Forked components (e.g., MPV shaders, Cmus themes) retain their respective licenses.


