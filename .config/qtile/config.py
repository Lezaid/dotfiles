# Qtile Config File
# http://www.qtile.org/

from libqtile import hook

from settings.workspaces import groups
from settings.keybindings import mod, keys, mouse
from settings.patterns import layouts, floating_layout
from settings.widgets import widget_defaults, extension_defaults
from settings.displays import screens
from settings.path import qtile_path

from os import path
import subprocess


@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, 'autostart.sh')])

main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = 'urgent'
wmname = 'LG3D'
