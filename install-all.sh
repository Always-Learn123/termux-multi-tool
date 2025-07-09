#!/data/data/com.termux/files/usr/bin/bash

echo "🛠️ Termux Tools Auto Installer Started..."

mkdir -p $HOME/termux-tools
cd $HOME/termux-tools

while read -r url; do
  echo "📦 Cloning: $url"
  git clone "$url" || { echo "❌ Failed to clone $url"; continue; }
  folder=$(basename "$url")
  folder="${folder%.*}"
  cd "$folder" 2>/dev/null || { echo "❌ Folder not found: $folder"; cd ..; continue; }
  if [ -f install.sh ]; then
    bash install.sh
  else
    echo "📁 No install.sh found for $folder"
  fi
  cd ..
  echo "✅ Done: $folder"
  echo "-------------------------------"
done < "$PWD/tools.txt"

echo "🎉 All tools processed!"
