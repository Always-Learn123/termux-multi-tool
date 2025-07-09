# Termux Multi Tool Installer

Installs 50+ GitHub tools automatically in Termux.

## 🚀 One-line Installer

```bash
pkg update -y && pkg install -y git wget dos2unix unzip && cd $HOME && wget [your-link] && unzip termux-multi-tool-github-upload.zip && cd termux-multi-tool-github-upload && bash fix-permissions.sh && bash install-all.sh
```

## 📄 Included Files
- install-all.sh
- uninstall-all.sh
- verify-tools.sh
- fix-permissions.sh
- tools.txt
