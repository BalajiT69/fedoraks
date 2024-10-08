# Generated by Anaconda 40.22.3
# Generated by pykickstart v3.52
#version=DEVEL
# Use graphical install
graphical

# Keyboard layouts
keyboard --vckeymap=in-eng --xlayouts='in (eng)'
# System language
lang en_IN.UTF-8

%packages
-openssh-server
-gssproxy
-nfs-utils
-sssd*
-abrt*
@base-x
@core
@standard
@fonts                                 # Fonts packages
@hardware-support                      # Various hardware specific utilities
@multimedia                            # Common audio/video frameworks
@networkmanager-submodules             # Common NetworkManager submodules
@firefox
@vlc
bluez
bash-color-prompt                      # Bash shell colors
desktop-backgrounds-gnome              # Fedora desktop backgrounds
evince
fedora-workstation-repositories        # Default Fedora repositories
gnome-backgrounds                      # GNOME desktop backgrounds
gnome-bluetooth
gnome-console
gnome-disk-utility
gnome-shell
gnome-software
gnome-system-monitor
gnome-tweaks
gnome-user-share
gnome-calculator
gnome-control-center
gnome-text-editor
gvfs
gvfs-afc
gvfs-goa
gvfs-smb
gvfs-mtp
nautilus
pinta
pipewire
pipewire-alsa
pipewire-jack-audio-connection-kit
pipewire-pulseaudio
pipewire-utils
plymouth-system-theme
power-profiles-daemon
transmission-gtk
wireplumber
xdg-desktop-portal-gnome
xdg-user-dirs-gtk

%end

# Run the Setup Agent on first boot
firstboot --enable

# Generated using Blivet version 3.9.1
ignoredisk --only-use=sda
autopart
# Partition clearing information
clearpart --none --initlabel

# System timezone
timezone Asia/Kolkata --utc

# Root password
rootpw --iscrypted --allow-ssh $y$j9T$5PAz5L4T85QmDrEmCgYxOsrq$iAGTxhHjmgYsuz8HJ/ZtseX.Vtav3uQSsn3N/KBjV08
user --groups=wheel --name=balajit --password=$y$j9T$MghTXyC.W/kK.hZIPX.w9Hju$cWVCJFNYWlPoxrWugDhuljjATLPQu2PiuWrclFw1wK6 --iscrypted --gecos="Balaji Thyagarajan"

%post
# Set the plymouth theme
plymouth-set-default-theme bgrt -R

# Change Systemd boot target
systemctl set-default graphical.target

# Configure Flatpak
systemctl disable flatpak-add-fedora-repos
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Flatpak apps
flatpak install -y flathub com.mattjakeman.ExtensionManager
%end

# Reboot after installation
reboot --eject
