#!/bin/bash

echo -e "\n+ + [ Now configuring openbox theme ] + + \n"
mkdir -p ~/.themes/Retro/openbox-3
cat > ~/.themes/Retro/openbox-3/themerc << 'EOF'
# Geometry
border.width: 1
padding.width: 8
padding.height: 8
window.handle.width: 0
window.client.padding.width: 0
menu.overlap: 0
menu.separator.width: 1
menu.separator.padding.width: 6
menu.separator.padding.height: 3

# Window frame
window.active.border.color: #9BE22F
window.inactive.border.color: #2A2A2A
window.active.client.color: #000000
window.inactive.client.color: #000000
window.active.title.separator.color: #9BE22F
window.inactive.title.separator.color: #2A2A2A
window.active.title.bg: flat solid
window.active.title.bg.color: #000000
window.active.handle.bg: flat solid
window.active.handle.bg.color: #000000
window.active.grip.bg: flat solid
window.active.grip.bg.color: #000000
window.active.label.bg: parentrelative
window.inactive.title.bg: flat solid
window.inactive.title.bg.color: #000000
window.inactive.handle.bg: flat solid
window.inactive.handle.bg.color: #000000
window.inactive.grip.bg: flat solid
window.inactive.grip.bg.color: #000000
window.inactive.label.bg: parentrelative
window.active.label.text.color: #9BE22F
window.inactive.label.text.color: #6B6B6B
window.label.text.justify: left

# Title buttons
window.active.button.unpressed.bg: flat solid
window.active.button.unpressed.bg.color: #000000
window.active.button.toggled.unpressed.bg: flat solid
window.active.button.toggled.unpressed.bg.color: #000000
window.active.button.hover.bg: flat solid
window.active.button.hover.bg.color: #2A2A2A
window.active.button.toggled.hover.bg: flat solid
window.active.button.toggled.hover.bg.color: #2A2A2A
window.active.button.pressed.bg: flat solid
window.active.button.pressed.bg.color: #111111
window.active.button.toggled.pressed.bg: flat solid
window.active.button.toggled.pressed.bg.color: #111111
window.active.button.disabled.bg: flat solid
window.active.button.disabled.bg.color: #000000
window.active.button.toggled.disabled.bg: flat solid
window.active.button.toggled.disabled.bg.color: #000000
window.inactive.button.unpressed.bg: flat solid
window.inactive.button.unpressed.bg.color: #000000
window.inactive.button.toggled.unpressed.bg: flat solid
window.inactive.button.toggled.unpressed.bg.color: #000000
window.inactive.button.hover.bg: flat solid
window.inactive.button.hover.bg.color: #2A2A2A
window.inactive.button.toggled.hover.bg: flat solid
window.inactive.button.toggled.hover.bg.color: #2A2A2A
window.inactive.button.pressed.bg: flat solid
window.inactive.button.pressed.bg.color: #111111
window.inactive.button.toggled.pressed.bg: flat solid
window.inactive.button.toggled.pressed.bg.color: #111111
window.inactive.button.disabled.bg: flat solid
window.inactive.button.disabled.bg.color: #000000
window.inactive.button.toggled.disabled.bg: flat solid
window.inactive.button.toggled.disabled.bg.color: #000000
window.active.button.unpressed.image.color: #CCCCCC
window.active.button.hover.image.color: #F0F0F0
window.active.button.pressed.image.color: #F26A1B
window.active.button.disabled.image.color: #2A2A2A
window.active.button.toggled.unpressed.image.color: #9BE22F
window.active.button.toggled.hover.image.color: #9BE22F
window.active.button.toggled.pressed.image.color: #F26A1B
window.inactive.button.unpressed.image.color: #6B6B6B
window.inactive.button.hover.image.color: #CCCCCC
window.inactive.button.pressed.image.color: #F26A1B
window.inactive.button.disabled.image.color: #2A2A2A
window.inactive.button.toggled.unpressed.image.color: #9BE22F
window.inactive.button.toggled.hover.image.color: #9BE22F
window.inactive.button.toggled.pressed.image.color: #F26A1B

# Menu
menu.border.color: #2A2A2A
menu.border.width: 1
menu.title.bg: flat solid
menu.title.bg.color: #000000
menu.title.text.color: #9BE22F
menu.title.text.justify: left
menu.items.bg: flat solid
menu.items.bg.color: #000000
menu.items.text.color: #CCCCCC
menu.items.disabled.text.color: #6B6B6B
menu.items.active.bg: flat solid
menu.items.active.bg.color: #9BE22F
menu.items.active.text.color: #000000
menu.items.active.disabled.text.color: #6B6B6B
menu.separator.color: #2A2A2A

# On-screen popups
osd.border.color: #9BE22F
osd.border.width: 1
osd.bg: flat solid
osd.bg.color: #000000
osd.label.bg: parentrelative
osd.label.text.color: #CCCCCC
osd.hilight.bg: flat solid
osd.hilight.bg.color: #9BE22F
osd.unhilight.bg: flat solid
osd.unhilight.bg.color: #2A2A2A
EOF
sed -i '/<theme>/,/<\/theme>/s|<name>[^<]*</name>|<name>Retro</name>|' ~/.config/openbox/rc.xml
sed -i 's|<titleLayout>[^<]*</titleLayout>|<titleLayout>LIMC</titleLayout>|' ~/.config/openbox/rc.xml
perl -0pi -e 's|(<font place="[^"]*">\s*<name>)[^<]*(</name>\s*<size>)[^<]*(</size>\s*<weight>)[^<]*|${1}ProFont IIx Nerd Font${2}10${3}Normal|g' ~/.config/openbox/rc.xml
rm -f ~/.themes/Retro/openbox-3/*.xbm
cat > ~/.themes/Retro/openbox-3/close.xbm << 'EOF'
#define close_width 9
#define close_height 9
static unsigned char close_bits[] = {
   0x83, 0x01,
   0xc6, 0x00,
   0x6c, 0x00,
   0x38, 0x00,
   0x38, 0x00,
   0x6c, 0x00,
   0xc6, 0x00,
   0x83, 0x01,
   0x01, 0x01 };
EOF
cat > ~/.themes/Retro/openbox-3/iconify.xbm << 'EOF'
#define iconify_width 9
#define iconify_height 9
static unsigned char iconify_bits[] = {
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0xff, 0x01,
   0xff, 0x01,
   0x00, 0x00 };
EOF
cat > ~/.themes/Retro/openbox-3/max.xbm << 'EOF'
#define max_width 9
#define max_height 9
static unsigned char max_bits[] = {
   0xff, 0x01,
   0xff, 0x01,
   0x01, 0x01,
   0x01, 0x01,
   0x01, 0x01,
   0x01, 0x01,
   0x01, 0x01,
   0x01, 0x01,
   0xff, 0x01 };
EOF
cat > ~/.themes/Retro/openbox-3/max_toggled.xbm << 'EOF'
#define max_toggled_width 9
#define max_toggled_height 9
static unsigned char max_toggled_bits[] = {
   0xf8, 0x01,
   0xf8, 0x01,
   0x08, 0x01,
   0x3f, 0x01,
   0x21, 0x01,
   0xe1, 0x01,
   0x21, 0x00,
   0x21, 0x00,
   0x3f, 0x00 };
EOF
openbox --reconfigure
echo -e "\n+ + [ Done ] + + \n"



echo -e "\n+ + [ Now configuring fonts ] + + \n"
sed -i 's|Sans 9|ProFontWindows Nerd Font 10|g' ~/.config/tint2/tint2rc
sed -i 's|^family = ".*"|family = "ProFontWindows Nerd Font Mono"|' ~/.config/alacritty/alacritty.toml
mkdir -p ~/.config/rofi
cat > ~/.config/rofi/font.rasi << 'EOF'
* {
    font: "ProFontWindows Nerd Font 11";
}
EOF
grep -q 'font.rasi' ~/.config/rofi/config.rasi 2>/dev/null || echo '@import "~/.config/rofi/font.rasi"' >> ~/.config/rofi/config.rasi
pkill -USR1 tint2 2>/dev/null
echo -e "\n+ + [ Done ] + + \n"
