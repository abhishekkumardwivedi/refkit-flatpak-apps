===== build app =========
We need libzmq library installed in the runtime.

Use below command to compile with zmq lib dependency
gcc -lzmq <source>.c -o <output>

touch zmq.sh
echo "----- this is form zmqbus ----" >> zmq.sh
flatpak build-init src com.permissive.zmq org.gnome.Sdk org.gnome.Platform 3.24
#flatpak build-init src com.permissive.zmq org.gnome.Sdk/x86_64/3.24 org.gnome.Platform/x86_64/3.24
flatpak build src mkdir /app/bin
flatpak build src install --mode=750 zmq.sh /app/bin
flatpak build-finish --command=zmq.sh src

===== build repo ========
flatpak build-export repo src stable

===== install app in target =====
sudo flatpak remote-add --no-gpg-verify lzmq repo
sudo flatpak remote-ls lzmq -d
sudo flatpak install lzmq com.permissive.zmq
sudo flatpak run com.permissive.zmq

===== upon changing any source content ====
flatpak build-export repo src stable
sudo flatpak uninstall com.permissive.zmq
sudo flatpak install laudio com.permissive.zmq
sudo flatpak run com.permissive.zmq
