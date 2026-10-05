#!/bin/bash

# Palette: bg #000000 | panel #111111 | edge #2A2A2A | muted #6B6B6B | fg #CCCCCC | lime #9BE22F | orange #F26A1B

PANEL="#000000"
PILL="#111111"
EDGE="#2A2A2A"
ACTIVE="#9BE22F"
ACTIVE_FG="#000000"
FG="#CCCCCC"
MUTED="#6B6B6B"

FONT="ProFontWindows Nerd Font 10"

WS=~/.config/tint2/workspaces.sh

echo -e "\n+ + [ Now rebuilding tint2 bar ] + + \n"
mkdir -p ~/.config/tint2
command -v xdotool >/dev/null || echo "xdotool missing, workspace numbers will not show"

cat > "$WS" << EOF
#!/bin/bash
d=\$(xdotool get_desktop)
n=\$(xdotool get_num_desktops)
out=""
for ((i=0; i<n; i++)); do
    if [ "\$i" = "\$d" ]; then
        out+="<span foreground=\"$ACTIVE_FG\" background=\"$ACTIVE\"> \$((i+1)) </span>"
    else
        out+="<span foreground=\"$MUTED\"> \$((i+1)) </span>"
    fi
done
echo "\$out"
EOF
chmod +x "$WS"

cat > ~/.config/tint2/tint2rc << EOF
rounded = 0
border_width = 0
background_color = $PANEL 100
border_color = #000000 0

rounded = 13
border_width = 1
background_color = $PILL 100
border_color = $EDGE 100

panel_items = CEFEES
panel_position = bottom center horizontal
panel_size = 100% 36
panel_margin = 0 0
panel_padding = 8 5 6
panel_background_id = 1
wm_menu = 1
panel_dock = 0
strut_policy = follow_size
panel_layer = top

systray_padding = 10 4 4
systray_background_id = 2
systray_sort = ascending
systray_icon_size = 18

time1_format = %H:%M
time1_font = $FONT
clock_font_color = $FG 100
clock_padding = 12 4
clock_background_id = 2

execp = new
execp_command = $WS
execp_interval = 1
execp_has_icon = 0
execp_markup = 1
execp_centered = 1
execp_font = $FONT
execp_font_color = $FG 100
execp_padding = 8 4
execp_background_id = 2

execp = new
execp_command = free -m | awk '/Mem:/ {printf "%d%% mem", \$3*100/\$2}'
execp_interval = 5
execp_has_icon = 0
execp_centered = 1
execp_font = $FONT
execp_font_color = $FG 100
execp_padding = 12 4
execp_background_id = 2

execp = new
execp_command = date '+%A %d/%m/%Y'
execp_interval = 30
execp_has_icon = 0
execp_centered = 1
execp_font = $FONT
execp_font_color = $FG 100
execp_padding = 12 4
execp_background_id = 2

mouse_left = none
mouse_middle = none
mouse_right = none
mouse_scroll_up = prev_desktop
mouse_scroll_down = next_desktop
EOF

if [ -n "$DISPLAY" ]; then
    pkill -x tint2
    sleep 0.5
    tint2 >/dev/null 2>&1 &
    disown
fi
echo -e "\n+ + [ Done ] + + \n"


echo -e "\n+ + [ Now configuring alacritty colors ] + + \n"
mkdir -p ~/.config/alacritty
cat > ~/.config/alacritty/colors.toml << 'EOF'
[colors.primary]
background = "#000000"
foreground = "#CCCCCC"

[colors.cursor]
text = "#000000"
cursor = "#9BE22F"

[colors.selection]
text = "#000000"
background = "#9BE22F"

[colors.normal]
black = "#000000"
red = "#F26A1B"
green = "#9BE22F"
yellow = "#8A8A8A"
blue = "#6B6B6B"
magenta = "#4D4D4D"
cyan = "#A8A8A8"
white = "#CCCCCC"

[colors.bright]
black = "#6B6B6B"
red = "#F26A1B"
green = "#9BE22F"
yellow = "#B5B5B5"
blue = "#999999"
magenta = "#808080"
cyan = "#D9D9D9"
white = "#F0F0F0"
EOF
grep -q 'colors.toml' ~/.config/alacritty/alacritty.toml 2>/dev/null || cat >> ~/.config/alacritty/alacritty.toml << 'EOF'

[general]
import = ["~/.config/alacritty/colors.toml"]
EOF
echo -e "\n+ + [ Done ] + + \n"



echo -e "\n+ + [ Now configuring rofi colors ] + + \n"
mkdir -p ~/.config/rofi
cat > ~/.config/rofi/colors.rasi << 'EOF'
* {
    background-color: #000000;
    text-color: #CCCCCC;
}

window {
    border: 1px;
    border-color: #9BE22F;
}

inputbar {
    padding: 6px;
    border: 0 0 1px 0;
    border-color: #2A2A2A;
}

prompt {
    text-color: #9BE22F;
}

element {
    padding: 4px 6px;
}

element-text {
    background-color: inherit;
    text-color: inherit;
}

element selected.normal {
    background-color: #9BE22F;
    text-color: #000000;
}

element selected.urgent {
    background-color: #F26A1B;
    text-color: #000000;
}
EOF
grep -q 'colors.rasi' ~/.config/rofi/config.rasi 2>/dev/null || echo '@theme "~/.config/rofi/colors.rasi"' >> ~/.config/rofi/config.rasi
echo -e "\n+ + [ Done ] + + \n"
