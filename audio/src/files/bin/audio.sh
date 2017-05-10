echo "[start]"
echo "hear bird sound ..."
paplay /app/bin/bird.wav
echo "listen one more time .."
paplay /app/bin/bird.wav
echo "now it is your time to record for 7 sec"
timeout 7s pacat -r testrec.wav
echo "listen what you said ..."
#paplay testrec.wav
sh
echo "playback and record flatpak session done"
echo "[done]"
