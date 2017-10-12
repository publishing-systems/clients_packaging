@ECHO OFF
setlocal
cd ./clients/
cd ./tv.twitch/
cd ./twitch_video_uploader_1/
cd ./workflows/
cd ./twitch_video_uploader/
cd ./twitch_video_uploader_2/
CALL run_debug.bat
cp log.txt ../../../../../../
