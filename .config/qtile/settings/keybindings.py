# Qtile keybindings

from libqtile.config import Key, Drag, Click
from libqtile.command import lazy
from libqtile.utils import guess_terminal

from settings.workspaces import groups


_terminal = guess_terminal()

mod = "mod4"

keys = [Key(key[0], key[1], key[2], desc=key[3]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down(), "Move focus down"),
    ([mod], "k", lazy.layout.up(), "Move focus up"),
    ([mod], "h", lazy.layout.left(), "Move focus to left"),
    ([mod], "l", lazy.layout.right(), "Move focus to right"),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow(), "Increase window size"),
    ([mod, "shift"], "h", lazy.layout.shrink(), "Reduce window size"),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating(), "Toggle floating"),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down(), "Move window down"),
    ([mod, "shift"], "k", lazy.layout.shuffle_up(), "Move window up"),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout(), "Toggle to next layout"),
    ([mod, "shift"], "Tab", lazy.prev_layout(), "Toggle to previous layout"),

    # Kill window
    ([mod], "w", lazy.window.kill(), "Kill focused window"),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen(), "Move focus to next screen"),
    ([mod], "comma", lazy.prev_screen(), "Move focus to previous screen"),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart(), "Restart Qtile"),
    ([mod, "control"], "q", lazy.shutdown(), "Close Qtile session"),
    ([mod], "r", lazy.spawncmd(), "Spawn a command using a prompt widget"),

    # ------------ App Configs ------------

    # Menu
    ([mod], "space", lazy.spawn("rofi -show drun"), "Menu Rofi"),

    # Window Nav
    ([mod, "shift"], "space", lazy.spawn("rofi -show"), "Window nav Rofi"),

    # Browser
    ([mod], "b", lazy.spawn("google-chrome-stable --enable-features=WebUIDarkMode --force-dark-mode"), "Chrome app"),

    # File Explorer
    ([mod], "e", lazy.spawn("thunar"), "Thunar app"),

    # Terminal
    ([mod], "Return", lazy.spawn(_terminal), "Launch terminal"),

    # Redshift
    # ([mod], "r", lazy.spawn("redshift -O 2400")),
    # ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    # ([mod], "s", lazy.spawn("scrot")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn("pulsemixer --change-volume -5"), "Lower volume"),
    ([], "XF86AudioRaiseVolume", lazy.spawn("pulsemixer --change-volume +5"), "Raise volume"),
    ([], "XF86AudioMute", lazy.spawn("pulsemixer --toggle-mute"), "Mute volume"),

    # Brightness
    # ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    # ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen(), desc="Switch to group {}".format(group.name)),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name, switch_group=True), desc="Switch to & move focused window to group {}".format(group.name))
    ])
