echo ""
echo ------------------
echo --- socket app ---
echo ------------------
echo ""
echo In this app, we will run two instance of this application,
echo at console 1 and console 2.
echo Clinet at console 2 will send message to server, at console 1.
echo ""
echo Run following command in two seperate cosoles
echo ""
echo console-1:
echo flatpak run --command=server com.permissive.socket
echo ""
echo console-2:
echo flatpak run --command=client com.permissive.socket
echo ""
echo ""
