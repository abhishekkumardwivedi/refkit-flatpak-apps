# Getting target image, Runtime and SDK
* Clone source file and compile
`
git clone https://github.com/klihub/intel-iot-refkit.git -b intel-iot-refkit/flatpak
git submodule init
git submodule update --recursive

source ./refkit-init-build-env
bitbake refkit-image-minimal-flatpak-runtime refkit-image-minimal-flatpak-sdk
`
* Install http-server in any linux machine to act as http server for hosting flatpak repo and start server with this directory

`
npm install http-server
http-server <home>/intel-iot-refkit/build/build/refkit-image-gateway.flatpak
`

* Now get these apps and export to repo. And make it available at webserver for access at device
`
flatpak remote-export socket/src/ ./repo
flatpak remote-export audio/src/ ./repo
flatpak remote-export ipc/shmem/src/ ./repo
flatpak remote-export ipc/zmqbus/src/ ./repo

http-server ./repo
`



# Let's have required SDK and Runtime ----

flatpak remote-add --from gnome https://sdk.gnome.org/gnome.flatpakrepo
flatpak remote-list -d
flatpak remote-ls -d gnome
sudo flatpak install gnome org.gnome.Sdk//3.24
sudo flatpak install gnome org.gnome.Platform//3.24
flatpak list -d

# Install apps from remote ------ 
sudo flatpak remote-add --no-gpg-verify apps https://github.com/abhishekkumardwivedi/flatpak-app/tree/master/repo
sudo flatpak install apps com.permissive.audio

# Others -----
flatpak build-update-repo --title="Flatpak sample apps"

# Run an app ------
flatpak run com.permissive.audio
# refkit-flatpak-apps


# Log output upon running socket app server and client
`
root      1334  0.0  0.0   4192  1180 pts/0    S+   05:35   0:00 /usr/libexec/flatpak-bwrap --args 10 recv
root      1338  0.0  0.0   4192  1272 pts/0    S+   05:35   0:00 /usr/libexec/flatpak-bwrap --args 15 /usr/libexec/flatpak-dbus-proxy --fd=12 unix:path=/run/user/0/b
root      1339  0.0  0.0 110936  1788 pts/0    Sl+  05:35   0:00 /usr/libexec/flatpak-dbus-proxy --fd=12 unix:path=/run/user/0/bus /run/user/0/.dbus-proxy/session-bu
root      1341  0.0  0.0   4556  1428 pts/0    S+   05:35   0:00 /usr/libexec/flatpak-bwrap --args 10 recv
root      1342 99.1  0.0   4160   716 pts/0    R+   05:35   1:19 recv
root      1343  0.0  0.0   4192  1204 pts/1    S+   05:35   0:00 /usr/libexec/flatpak-bwrap --args 10 send
root      1347  0.0  0.0   4192  1228 pts/1    S+   05:35   0:00 /usr/libexec/flatpak-bwrap --args 14 /usr/libexec/flatpak-dbus-proxy --fd=12 unix:path=/run/user/0/b
root      1348  0.0  0.0 110936  1956 pts/1    Sl+  05:35   0:00 /usr/libexec/flatpak-dbus-proxy --fd=12 unix:path=/run/user/0/bus /run/user/0/.dbus-proxy/session-bu
root      1350  0.0  0.0   4556  1496 pts/1    S+   05:35   0:00 /usr/libexec/flatpak-bwrap --args 10 send
root      1351  0.0  0.0   4160   644 pts/1    S+   05:35   0:00 send
`
