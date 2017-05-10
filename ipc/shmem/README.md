===== build app =========
touch shmem.sh
echo "----- this is form shmem ----" >> shmem.sh
flatpak build-init src com.permissive.shmem org.gnome.Sdk org.gnome.Platform 3.24
#flatpak build-init src com.permissive.shmem org.gnome.Sdk/x86_64/3.24 org.gnome.Platform/x86_64/3.24
flatpak build src mkdir /app/bin
flatpak build src install --mode=750 shmem.sh /app/bin
flatpak build-finish --command=shmem.sh src

===== build repo ========
flatpak build-export repo src stable

===== install app in target =====
sudo flatpak remote-add --no-gpg-verify lshmem repo
sudo flatpak remote-ls lshmem -d
sudo flatpak install lshmem com.permissive.shmem
flatpak run com.permissive.shmem

===== upon changing any source content ====
flatpak build-export repo src stable
sudo flatpak uninstall com.permissive.shmem
sudo flatpak install laudio com.permissive.shmem
flatpak run com.permissive.shmem
