#!/data/data/com.termux/files/usr/bin/bash

echo "🛠️ Termux Tools Auto Installer Started..."

mkdir -p $HOME/termux-tools
cd $HOME/termux-tools

tool_list="$HOME/termux-multi-tool/tools.txt"

# Check if the tools file exists
if [ ! -f "$tool_list" ]; then
  echo "❌ tools.txt not found at $tool_list"
  exit 1
fi

dos2unix "$tool_list"

while IFS= read -r url; do
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
done < "$tool_list"

echo "🎉 All tools processed!"
