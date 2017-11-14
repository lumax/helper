#!/bin/bash
sudo vmhgfs-fuse -o allow_other -o auto_unmount -o uid=1000 -o gid=1000 .host:/temp /mnt/hgfs/temp
