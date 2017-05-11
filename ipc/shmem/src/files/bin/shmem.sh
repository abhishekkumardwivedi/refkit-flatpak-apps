echo ""
echo -------------------------
echo --- Shared memory app ---
echo -------------------------
echo ""
echo In this app, we will run two instance of this application,
echo at console 1 and console 2.
echo Sender at console 2 will send message to receiver, running at
echo console 1. Receiver app will show the message sent.
echo ""
echo Run following command in two seperate cosoles
echo ""
echo console-1:
echo flatpak run --command=recv com.permissive.shmem
echo ""
echo console-2:
echo flatpak run --command=send com.permissive.shmem
echo ""
echo ""
