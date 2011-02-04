#!/bin/bash
gnome-terminal --geometry=96x11+0+0 &
gnome-terminal --geometry=96x46+0+240 --command="kermit .uart_kermrc -c" &
gnome-terminal --geometry=96x30+790+0 &
gnome-terminal --geometry=96x27+790+562 &