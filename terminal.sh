#!/bin/bash
gnome-terminal --geometry=84x11+18+0 --working-directory=/opt/source/docker/ea20 &
gnome-terminal --geometry=84x37+18+340 --command="kermit .uart_kermrc -c" &
gnome-terminal --geometry=90x25+860+0 --working-directory=/opt/source &
gnome-terminal --geometry=90x28+860+562 --working-directory=/opt/source &
