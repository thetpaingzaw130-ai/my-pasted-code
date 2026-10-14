#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v pkg >/dev/null 2>&1; then
    echo "ဒီ script ကို Termux အတွင်းမှာပဲ run လုပ်ပါ။"
    exit 1
fi

pkg update -y
pkg install -y python

chmod +x "$SCRIPT_DIR/pasted_content.txt"

if [ ! -d "$HOME/storage" ]; then
    echo "ဖုန်း storage ခွင့်ပြုချက်ပေးရန် အောက်ပါ command ကို run လုပ်ပါ:"
    echo "  termux-setup-storage"
fi

echo
 echo "Setup ပြီးပါပြီ။ Local-only file inventory ပြုလုပ်ရန်:"
echo "  python \"$SCRIPT_DIR/pasted_content.txt\" /sdcard -o \"$SCRIPT_DIR/file_inventory.csv\""
echo
echo "မှတ်ချက်: ဒီ tool က ဖိုင်များကို မည်သည့် server သို့မျှ upload/send မလုပ်ပါ။"
