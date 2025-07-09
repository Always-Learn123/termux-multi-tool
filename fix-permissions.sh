#!/data/data/com.termux/files/usr/bin/bash
echo "🔧 Fixing script permissions..."
for script in *.sh; do
  dos2unix "$script"
  chmod +x "$script"
done
echo "✅ All .sh files fixed and ready to run!"
