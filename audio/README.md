===== build app =========
flatpak build-init src com.permissive.audio org.gnome.Sdk org.gnome.Platform 3.24
#flatpak build-init src com.permissive.audio org.gnome.Sdk/x86_64/3.24 org.gnome.Platform/x86_64/3.24
flatpak build src mkdir /app/bin
flatpak build src install --mode=750 audio.sh /app/bin

===== build repo ========
flatpak build-export repo src stable

===== install app in target =====
flatpak --user remote-add --no-gpg-verify laudio repo
sudo flatpak --user remote-ls laudio -d
sudo flatpak --user install laudio com.permissive.audio
flatpak run com.permissive.audio

===== upon changing any source content ====
flatpak build-export repo src stable
sudo flatpak --user uninstall com.permissive.audio 
sudo flatpak --user install laudio com.permissive.audio
flatpak run com.permissive.audio
