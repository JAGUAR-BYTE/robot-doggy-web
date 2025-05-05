#!/bin/bash

set -e

echo "✅ Installing and linking Scratch VM..."
if [ ! -d "scratch-vm" ]; then
  git clone https://github.com/LLK/scratch-vm.git
fi

cd scratch-vm
npm install
npm link
cd ..

echo "✅ Installing Scratch GUI and linking VM..."
if [ ! -d "scratch-gui" ]; then
  git clone https://github.com/LLK/scratch-gui.git
fi

cd scratch-gui
npm install
npm link scratch-vm

echo "✅ Starting Scratch GUI on port 8601..."
npm start -- --port 8601
