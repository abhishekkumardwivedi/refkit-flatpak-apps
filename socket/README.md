===== build app =========
flatpak build-init src com.permissive.socket org.gnome.Sdk org.gnome.Platform 3.24
#flatpak build-init src com.permissive.audio org.gnome.Sdk/x86_64/3.24 org.gnome.Platform/x86_64/3.24
flatpak build src mkdir /app/bin
flatpak build src install --mode=750 socket.sh /app/bin
flatpak build-finish --command=socket.sh src

===== build repo ========
flatpak build-export repo src stable

===== install app in target =====
flatpak --user remote-add --no-gpg-verify lsocket repo
sudo flatpak --user remote-ls lsocket -d
sudo flatpak --user install lsocket com.permissive.socket
flatpak run com.permissive.socket

===== upon changing any source content ====
flatpak build-export repo src stable
sudo flatpak --user uninstall com.permissive.socket
sudo flatpak --user install laudio com.permissive.socket
flatpak run com.permissive.socket
