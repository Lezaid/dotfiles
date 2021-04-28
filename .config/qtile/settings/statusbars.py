# Qtile status bars

from libqtile import bar, widget

import settings.widgets as c_widget


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def status_bar(widgets):
    return bar.Bar(widgets, 24, opacity=0.95)

primary_bar = status_bar([
    c_widget.separator(),
    *c_widget.workspaces(),
    c_widget.separator(),
    *c_widget.updates_powerline(),
    *c_widget.network_powerline(),
    *c_widget.layout_powerline(),
    *c_widget.datetime_powerline(),
    *c_widget.systray_powerline()
])

secondary_bar = status_bar([
    c_widget.separator(),
    *c_widget.workspaces(),
    c_widget.separator(),
    *c_widget.layout_powerline(bg='dark'),
    *c_widget.datetime_powerline(),
    c_widget.powerline_arrow('dark', 'color1')
])
