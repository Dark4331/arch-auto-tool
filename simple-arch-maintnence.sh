#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}[1/4] Updating system packages...${NC}"
sudo pacman -Syu --noconfirm

echo -e "${BLUE}[2/4] Checking for orphan packages...${NC}"
if [ -n "$(pacman -Qtdq)" ]; then
    sudo pacman -Rns $(pacman -Qtdq) --noconfirm
else
    echo -e "${YELLOW}No orphan packages found.${NC}"
fi

echo -e "${BLUE}[3/4] Cleaning package cache...${NC}"
sudo paccache -r

echo -e "${GREEN}[4/4] Maintenance completed successfully!${NC}"
echo "--------------------------------------------------"
echo -e "${GREEN}DISK SPACE USAGE:${NC}"
df -h /
echo "--------------------------------------------------"