#!/bin/bash

echo -e "\n+ + [ Now installing core packages ] + + \n"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm xorg-server xorg-xinit xorg-xsetroot xorg-xset xorg-setxkbmap xdg-user-dirs xdg-utils
sudo pacman -S --needed --noconfirm openbox tint2 feh obconf-qt lxappearance



echo -e "\n+ + [ Now creating user directories ] + + \n"
mkdir -p ~/{Pictures,Downloads,Videos,Desktop,Music,Documents}
mkdir -p ~/Pictures/{Screenshots/{Sorted,Unsorted},Wallpapers,Saved}
mkdir -p ~/Music/{Songs,Sounds}
mkdir -p ~/Videos/{Saved,Unsorted}
mkdir -p ~/Documents/{Projects/{Active,Temp,Logs,Idle},Papers/{Notes,Guides},Misc}
xdg-user-dirs-update
echo -e "\n+ + [ Done ] + + \n"



echo -e "\n+ + [ Now installing user packages ] + + \n"
sudo pacman -S --needed --noconfirm alacritty openssh fzf eza bat btop pfetch ufw git git-delta neovim zoxide man-db man-pages yazi
sudo pacman -S --needed --noconfirm imv mpv firefox nemo rofi ly maim slop clipmenu xdotool xclip
sudo pacman -S  --needed --noconfirm tcpdump nmap termshark vnstat bandwhich iftop nethogs nload bmon bind traceroute
echo "Choose your main font: "
select font in ttf-bigblueterminal-nerd ttf-gohu-nerd ttf-profont-nerd ttf-terminus-nerd
do
    [[ -n "$font" ]] || { echo "Invalid choice, try again."; continue; }
    sudo pacman -S --needed --noconfirm "$font"
    break
done
fc-cache -f
echo -e "\n+ + [ Done ] + + \n"



echo -e "\n+ + [ Now starting services ] + + \n"
if systemctl list-unit-files | grep -q '^ly@\.service'; then
    sudo systemctl disable getty@tty2.service
    sudo systemctl enable ly@tty2.service
else
    sudo systemctl enable ly.service
fi
sudo systemctl enable ufw
sudo systemctl enable sshd
echo -e "\n+ + [ Done ] + + \n"



echo -e "\n+ + [ Now configuring firewall ] + + \n"
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw --force enable
echo -e "\n+ + [ Done ] + + \n"



echo -e "\n+ + [ Now Configuring openbox ] + + \n"
mkdir -p ~/.config/openbox
cp /etc/xdg/openbox/{rc.xml,menu.xml,environment} ~/.config/openbox/


cat > ~/.config/openbox/autostart << 'EOF'
setxkbmap us &
xset r rate 300 50 &
xset s 600 &
xsetroot -cursor_name left_ptr &

[ -f ~/Pictures/Wallpapers/1.jpg ] && feh --bg-fill ~/Pictures/Wallpapers/1.jpg &
tint2 &
clipmenud &
EOF


echo 'exec openbox-session' > ~/.xinitrc

RC=~/.config/openbox/rc.xml
BINDS=/tmp/ob-binds.xml

sed -i '/<desktops>/,/<\/desktops>/s|<number>[0-9]*</number>|<number>10</number>|' "$RC"
perl -0pi -e 's|<names>.*?</names>|<names><name>1</name><name>2</name><name>3</name><name>4</name><name>5</name><name>6</name><name>7</name><name>8</name><name>9</name><name>10</name></names>|s' "$RC"

: > "$BINDS"

# --- Keys ---
cat >> "$BINDS" << 'EOF'
<keybind key="A-q"><action name="Execute"><command>alacritty</command></action></keybind>
<keybind key="A-b"><action name="Execute"><command>firefox</command></action></keybind>
<keybind key="A-S-b"><action name="Execute"><command>firefox --private-window</command></action></keybind>
<keybind key="A-e"><action name="Execute"><command>nemo</command></action></keybind>

<keybind key="A-p"><action name="Execute"><command>sh -c 'maim $HOME/Pictures/Screenshots/Unsorted/full_$(date +%Y-%m-%d_%H-%M-%S).png'</command></action></keybind>
<keybind key="A-C-p"><action name="Execute"><command>sh -c 'maim -i $(xdotool getactivewindow) $HOME/Pictures/Screenshots/Unsorted/window_$(date +%Y-%m-%d_%H-%M-%S).png'</command></action></keybind>
<keybind key="A-S-p"><action name="Execute"><command>sh -c 'maim -s $HOME/Pictures/Screenshots/Unsorted/area_$(date +%Y-%m-%d_%H-%M-%S).png'</command></action></keybind>
<keybind key="A-r"><action name="Execute"><command>rofi -show drun</command></action></keybind>

<keybind key="A-c"><action name="Close"/></keybind>
<keybind key="A-Escape"><action name="Exit"/></keybind>
<keybind key="A-f"><action name="ToggleFullscreen"/></keybind>
<keybind key="A-h"><action name="ResizeRelative"><right>-20</right></action></keybind>
<keybind key="A-l"><action name="ResizeRelative"><right>20</right></action></keybind>

<keybind key="A-Left"><action name="DirectionalCycleWindows"><direction>left</direction></action></keybind>
<keybind key="A-Down"><action name="DirectionalCycleWindows"><direction>down</direction></action></keybind>
<keybind key="A-Up"><action name="DirectionalCycleWindows"><direction>up</direction></action></keybind>
<keybind key="A-Right"><action name="DirectionalCycleWindows"><direction>right</direction></action></keybind>
<keybind key="A-C-Left"><action name="MoveToEdgeWest"/></keybind>
<keybind key="A-C-Down"><action name="MoveToEdgeSouth"/></keybind>
<keybind key="A-C-Up"><action name="MoveToEdgeNorth"/></keybind>
<keybind key="A-C-Right"><action name="MoveToEdgeEast"/></keybind>

<keybind key="A-Tab"><action name="NextWindow"/></keybind>
<keybind key="A-S-Tab"><action name="PreviousWindow"/></keybind>
<keybind key="A-grave"><action name="ShowMenu"><menu>client-list-combined-menu</menu></action></keybind>
<keybind key="A-m"><action name="Iconify"/></keybind>
<keybind key="A-space"><action name="ShowMenu"><menu>client-menu</menu></action></keybind>
<keybind key="A-Home"><action name="MoveResizeTo"><x>center</x><y>center</y></action></keybind>
<keybind key="A-S-Left"><action name="MoveResizeTo"><x>0</x><y>0</y><width>50%</width><height>100%</height></action></keybind>
<keybind key="A-S-Right"><action name="MoveResizeTo"><x>-0</x><y>0</y><width>50%</width><height>100%</height></action></keybind>
<keybind key="A-S-Up"><action name="ToggleMaximize"/></keybind>
<keybind key="A-S-Down"><action name="Unmaximize"/></keybind>
<keybind key="A-bracketleft"><action name="GoToDesktop"><to>left</to><wrap>yes</wrap></action></keybind>
<keybind key="A-bracketright"><action name="GoToDesktop"><to>right</to><wrap>yes</wrap></action></keybind>

<keybind key="A-S-t"><action name="ToggleDecorations"/></keybind>
<keybind key="A-t"><action name="ToggleMaximize"/></keybind>
EOF

for i in 1 2 3 4 5 6 7 8 9; do
cat >> "$BINDS" << EOF
<keybind key="A-$i"><action name="GoToDesktop"><to>$i</to></action></keybind>
<keybind key="A-S-$i"><action name="SendToDesktop"><to>$i</to></action></keybind>
EOF
done

cat >> "$BINDS" << 'EOF'
<keybind key="A-0"><action name="GoToDesktop"><to>10</to></action></keybind>
<keybind key="A-S-0"><action name="SendToDesktop"><to>10</to></action></keybind>
EOF

sed -i '/<keyboard>/r /tmp/ob-binds.xml' "$RC"
rm -f "$BINDS"



# --- Root menu ---
cat > ~/.config/openbox/menu.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<openbox_menu xmlns="http://openbox.org/3.4/menu">
<menu id="root-menu" label="Openbox">
  <item label="Terminal"><action name="Execute"><command>alacritty</command></action></item>
  <item label="Firefox"><action name="Execute"><command>firefox</command></action></item>
  <item label="Files"><action name="Execute"><command>nemo</command></action></item>
  <item label="Run..."><action name="Execute"><command>rofi -show drun</command></action></item>
  <separator/>
  <menu id="system-menu" label="System">
    <item label="Appearance"><action name="Execute"><command>lxappearance</command></action></item>
    <item label="Openbox Config"><action name="Execute"><command>obconf</command></action></item>
    <item label="System Monitor"><action name="Execute"><command>alacritty -e btop</command></action></item>
    <item label="Edit rc.xml"><action name="Execute"><command>alacritty -e nvim ~/.config/openbox/rc.xml</command></action></item>
    <item label="Edit autostart"><action name="Execute"><command>alacritty -e nvim ~/.config/openbox/autostart</command></action></item>
  </menu>
  <menu id="client-list-combined-menu"/>
  <separator/>
  <item label="Reconfigure"><action name="Reconfigure"/></item>
  <item label="Restart"><action name="Restart"/></item>
  <separator/>
  <item label="Reboot"><action name="Execute"><command>systemctl reboot</command></action></item>
  <item label="Shutdown"><action name="Execute"><command>systemctl poweroff</command></action></item>
  <item label="Exit"><action name="Exit"/></item>
</menu>
</openbox_menu>
EOF



# --- Environment ---
cat > ~/.config/openbox/environment << 'EOF'
export GTK_THEME=Adwaita:dark
export EDITOR=nvim
export TERMINAL=alacritty
EOF

echo -e "\n+ + [ Done ] + + \n"



echo -e "\n+ + [ Now configuring alacritty ] + + \n"
mkdir -p ~/.config/alacritty
case "$font" in
    ttf-bigblueterminal-nerd) FONT_FAMILY="BigBlueTerm437 Nerd Font Mono" ;;
    ttf-gohu-nerd)            FONT_FAMILY="GohuFont uni14 Nerd Font Mono" ;;
    ttf-profont-nerd)         FONT_FAMILY="ProFont Nerd Font Mono" ;;
    ttf-terminus-nerd)        FONT_FAMILY="Terminess Nerd Font Mono" ;;
esac
cat > ~/.config/alacritty/alacritty.toml << EOF
[font]
size = 12.0

[font.normal]
family = "$FONT_FAMILY"

[window]
padding = { x = 6, y = 6 }
EOF
echo -e "\n+ + [ Done ] + + \n"




echo -e "\n+ + [ Now configuring git ] + + \n"
git config --global init.defaultBranch main
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictstyle zdiff3
echo -e "\n+ + [ Done ] + + \n"




echo -e "\n+ + [ Now configuring default apps ] + + \n"
xdg-mime default nemo.desktop inode/directory
xdg-settings set default-web-browser firefox.desktop 2>/dev/null
xdg-mime default imv.desktop image/png image/jpeg image/gif image/webp
xdg-mime default mpv.desktop video/mp4 video/x-matroska video/webm audio/mpeg audio/flac
Lecho -e "\n+ + [ Done ] + + \n"




echo -e "\n+ + [ Now configuring tint2 ] + + \n"
mkdir -p ~/.config/tint2
cat > ~/.config/tint2/tint2rc << 'EOF'
rounded = 0
border_width = 0
background_color = #1e1e2e 100
border_color = #000000 0

rounded = 13
border_width = 1
background_color = #313244 100
border_color = #45475a 100

rounded = 9
border_width = 0
background_color = #89b4fa 100
border_color = #000000 0

rounded = 9
border_width = 0
background_color = #45475a 100
border_color = #000000 0

rounded = 9
border_width = 0
background_color = #f38ba8 100
border_color = #000000 0

panel_items = CTFEFES
panel_position = bottom center horizontal
panel_size = 100% 36
panel_margin = 0 0
panel_padding = 8 5 6
panel_background_id = 1
wm_menu = 1
panel_dock = 0
strut_policy = follow_size
panel_layer = top

taskbar_mode = multi_desktop
taskbar_padding = 4 4 4
taskbar_background_id = 0
taskbar_active_background_id = 0
taskbar_name = 1
taskbar_name_padding = 5 0
taskbar_name_background_id = 4
taskbar_name_active_background_id = 3
taskbar_name_font = Sans 9
taskbar_name_font_color = #cdd6f4 100
taskbar_name_active_font_color = #1e1e2e 100

task_text = 0
task_icon = 0
task_maximum_size = 1 1
task_padding = 0 0 0
task_font = Sans 9
task_font_color = #cdd6f4 100
task_active_font_color = #cdd6f4 100
task_background_id = 0
task_active_background_id = 0
task_urgent_background_id = 5
task_iconified_background_id = 0

systray_padding = 10 4 4
systray_background_id = 2
systray_sort = ascending
systray_icon_size = 18

time1_format = %H:%M
time1_font = Sans 9
clock_font_color = #cdd6f4 100
clock_padding = 12 4
clock_background_id = 2

execp = new
execp_command = date '+%A %d/%m/%Y'
execp_interval = 30
execp_has_icon = 0
execp_centered = 1
execp_font = Sans 9
execp_font_color = #cdd6f4 100
execp_padding = 12 4
execp_background_id = 2

execp = new
execp_command = free -m | awk '/Mem:/ {printf "%d%% mem", $3*100/$2}'
execp_interval = 5
execp_has_icon = 0
execp_centered = 1
execp_font = Sans 9
execp_font_color = #cdd6f4 100
execp_padding = 12 4
execp_background_id = 2

mouse_left = toggle_iconify
mouse_middle = close
mouse_right = none
mouse_scroll_up = prev_desktop
mouse_scroll_down = next_desktop
EOF
echo -e "\n+ + [ Done ] + + \n"




echo -e "\n+ + [ Now configuring neovim ] + + \n"
mkdir -p ~/.config/nvim
cat > ~/.config/nvim/init.lua << 'EOF'
-- Basic options
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = false
-- Wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 0
vim.opt.showbreak = "↪ "
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2"
-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = false
vim.opt.fillchars = {
    fold = "·",
    foldopen = "▾",
    foldclose = "▸",
    foldsep = "│",
}
-- Colors and transparent background
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "@comment", { ctermfg = 8 })
        vim.api.nvim_set_hl(0, "@string", { ctermfg = 2 })
        vim.api.nvim_set_hl(0, "@function", { ctermfg = 4 })
        vim.api.nvim_set_hl(0, "@keyword", { ctermfg = 5 })
        vim.api.nvim_set_hl(0, "@type", { ctermfg = 3 })
        vim.api.nvim_set_hl(0, "@variable", { ctermfg = 7 })
        vim.api.nvim_set_hl(0, "@constant", { ctermfg = 6 })
        vim.api.nvim_set_hl(0, "@number", { ctermfg = 6 })
    end,
})
vim.cmd("colorscheme default")
-- Persistent undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undolevels = 10000
-- Clipboard
vim.opt.clipboard = "unnamedplus"
-- Restore cursor position on open
vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Return to last cursor position when reopening a file",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
            vim.cmd("normal! zz")
        end
    end,
})
-- Auto format on save, guarded
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
            vim.lsp.buf.format({ async = false })
        end
    end,
})

-- Minimal built-in autopairs (no plugin manager, no git dependency)
do
    local pairs_map = {
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = '"',
        ["'"] = "'",
    }
    local closers = { [")"] = true, ["]"] = true, ["}"] = true, ['"'] = true, ["'"] = true }
    local quotes = { ['"'] = true, ["'"] = true }

    for open, close in pairs(pairs_map) do
        vim.keymap.set("i", open, function()
            local col = vim.fn.col(".")
            local line = vim.fn.getline(".")
            local prev_char = line:sub(col - 1, col - 1)
            if quotes[open] and prev_char:match("%w") then
                return open
            end
            return open .. close .. "<Left>"
        end, { expr = true })
    end

    for close, _ in pairs(closers) do
        if not pairs_map[close] or quotes[close] then
            vim.keymap.set("i", close, function()
                local col = vim.fn.col(".")
                local line = vim.fn.getline(".")
                local prev_char = line:sub(col - 1, col - 1)
                local next_char = line:sub(col, col)
                if next_char == close then
                    return "<Right>"
                end
                if quotes[close] and prev_char:match("%w") then
                    return close
                end
                if quotes[close] then
                    return close .. close .. "<Left>"
                end
                return close
            end, { expr = true })
        end
    end

    vim.keymap.set("i", "<BS>", function()
        local col = vim.fn.col(".")
        local line = vim.fn.getline(".")
        local prev_char = line:sub(col - 1, col - 1)
        local next_char = line:sub(col, col)
        if pairs_map[prev_char] == next_char then
            return "<BS><Del>"
        end
        return "<BS>"
    end, { expr = true })

    vim.keymap.set("i", "<CR>", function()
        local col = vim.fn.col(".")
        local line = vim.fn.getline(".")
        local prev_char = line:sub(col - 1, col - 1)
        local next_char = line:sub(col, col)
        if pairs_map[prev_char] == next_char then
            return "<CR><Esc>O"
        end
        return "<CR>"
    end, { expr = true })
end

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    float = {
        border = "rounded",
        source = true,
    },
})
-- Keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("v", "<C-a>", "<Esc>ggVG")
vim.keymap.set("i", "<C-v>", "<C-r>+")
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("v", "<C-v>", '"+p')
vim.keymap.set({ "n", "v" }, "<Down>", "gj")
vim.keymap.set({ "n", "v" }, "<Up>", "gk")
EOF
echo -e "\n+ + [ Done ] + + \n"


echo -e "\n+ + [ Now configuring bashrc ] + + \n"
[ -f ~/.bashrc ] && cp ~/.bashrc ~/.bashrc.bak
echo "" > ~/.bashrc
cat >> ~/.bashrc << 'EOF'
#
# ~/.bashrc
#

# = = = = = General = = = = =

# -- Defaults
[[ $- != *i* ]] && return
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PAGER="less -R"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# -- Performance
shopt -s cdable_vars
shopt -s cmdhist
shopt -s lithist
shopt -s cdspell
shopt -s nocaseglob
shopt -s extglob

# -- History
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# -- PS1
PS1='\[\033[34m\]\u\[\033[00m\]@\[\033[36m\]\h\[\033[00m\]: \[\033[34m\]\w\[\033[00m\] \[\033[35m\][\t]\[\033[00m\]\$ '

# = = = = = Aliases = = = = =

# + + [ Base Aliases ]
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias qe='pacman -Qe'
alias df='df -h'
alias du='du -h'
alias cal='cal -3'

# + + [ Tool Aliases ]
export BAT_THEME="Nord"
export EDITOR=nvim
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
alias ll='eza -a --color=auto --icons'
alias lo='eza --tree -a --icons -I ".git|node_modules|.venv"'
alias copy='xclip -selection clipboard'
alias pf='pfetch'
alias v='nvim'
alias vv='vim'
alias fir='firefox'
alias fira='firefox --private-window'

# = = = = = Functions = = = = =

# --Yazi cd on close
function yy() {
local tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

services() {
    case "$1" in
        -a|--all)      systemctl list-units --type=service --all ;;
        -r|--running)  systemctl list-units --type=service --state=running ;;
        -f|--failed)   systemctl list-units --type=service --state=failed ;;
        -i|--inactive) systemctl list-units --type=service --state=inactive ;;
        *) echo "Usage: services [-a|--all] [-r|--running] [-f|--failed] [-i|--inactive]" ;;
    esac
}


EOF
echo -e "\n+ + [ Done ] + + \n"
