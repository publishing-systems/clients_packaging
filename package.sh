#!/bin/sh
# Copyright (C) 2017  Stephan Kreutzer
#
# This file is part of clients_packaging for clients.
#
# clients_packaging is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License version 3 or any later version,
# as published by the Free Software Foundation.
#
# clients_packaging is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License 3 for more details.
#
# You should have received a copy of the GNU Affero General Public License 3
# along with clients_packaging. If not, see <http://www.gnu.org/licenses/>.

rm -rf .git

git clone https://github.com/publishing-systems/digital_publishing_workflow_tools/
cd digital_publishing_workflow_tools
rm -rf .git
make
cd ..

git clone https://github.com/publishing-systems/clients/
cd clients
rm -rf .git
make
cd ..

mkdir twitch_video_uploader_1
cd twitch_video_uploader_1
mkdir ./clients/
cp -r ../clients/tv.twitch/ ./clients/
mkdir -p ./digital_publishing_workflow_tools/https_client/
cp -r ../digital_publishing_workflow_tools/https_client/https_client_1/ ./digital_publishing_workflow_tools/https_client/
mkdir -p ./digital_publishing_workflow_tools/json_to_xml/
cp -r ../digital_publishing_workflow_tools/json_to_xml/json_to_xml_1/ ./digital_publishing_workflow_tools/json_to_xml/
cd ..

printf "Build date: $(date "+%Y-%m-%d").\n" > ./twitch_video_uploader_1/version.txt
currentDate=$(date "+%Y%m%d")

cp -r twitch_video_uploader_1 twitch_video_uploader_1_gnu
cp -r -n scripts_twitch_video_uploader_1_gnu/* twitch_video_uploader_1_gnu
zip -r twitch_video_uploader_1_gnu_$currentDate.zip twitch_video_uploader_1_gnu
sha256sum twitch_video_uploader_1_gnu_$currentDate.zip > twitch_video_uploader_1_gnu_$currentDate.zip.sha256
rm -r twitch_video_uploader_1_gnu

cp -r twitch_video_uploader_1 twitch_video_uploader_1_windows
cp -r -n scripts_twitch_video_uploader_1_windows/* twitch_video_uploader_1_windows
zip -r twitch_video_uploader_1_windows_$currentDate.zip twitch_video_uploader_1_windows
sha256sum twitch_video_uploader_1_windows_$currentDate.zip > twitch_video_uploader_1_windows_$currentDate.zip.sha256
rm -r twitch_video_uploader_1_windows

rm -r digital_publishing_workflow_tools
rm -r clients
rm -r twitch_video_uploader_1
