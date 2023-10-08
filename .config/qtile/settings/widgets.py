# Qtile wigets

from libqtile import widget

from settings.theme import colors, get_widgetground_colors, get_widget_format
from settings.path import qtile_path

from os import path


def separator():
    return widget.Sep(
        **get_widgetground_colors(),
        linewidth=0,
        padding=5
    )

def icon(fg='text', bg='dark', fontsize=16, text='?'):
    return widget.TextBox(
        **get_widgetground_colors(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )

def powerline_arrow(fg='light', bg='dark'):
    return widget.TextBox(
        **get_widgetground_colors(fg, bg),
        text='', # Icon: nf-pl-right_hard_divider
        fontsize=30,
        padding=0
    )

def workspaces(): 
    return [
        widget.GroupBox(
            **get_widgetground_colors(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(
            **get_widgetground_colors(fg='focus'),
            fontsize=14,
            padding=5
        )
    ]

def updates_powerline(fg='color4', bg='dark'): 
    return [
        powerline_arrow(fg, bg),
        icon(bg=fg, text=' '), # Icon: nf-fa-download
        widget.CheckUpdates(
            background=colors[fg],
            colour_have_updates=colors['text'],
            colour_no_updates=colors['text'],
            no_update_string='0',
            distro='Arch',
            display_format='{updates}',
            update_interval=1800, # Seconds
            custom_command='checkupdates', # Require: pacman-contrib (pacman)
            padding=3
        )
    ]

def network_powerline(fg='color3', bg='color4'): 
    return [
        powerline_arrow(fg, bg),
        icon(bg=fg, text=' '), # Icon: nf-fa-feed
        widget.Net( # Require: psutil (pip)
            **get_widgetground_colors(bg=fg),
            interface='wlan0',
            padding=3
        )
    ]

def layout_powerline(fg='color2', bg='color3'): 
    return [
        powerline_arrow(fg, bg),
        widget.CurrentLayoutIcon(
            **get_widgetground_colors(bg=fg),
            custom_icon_paths=[path.join(qtile_path, 'icons', 'layout')],
            scale=0.65
        ),
        widget.CurrentLayout(
            **get_widgetground_colors(bg=fg),
            **get_widget_format('{!k}'),
            padding=3
        )
    ]

def datetime_powerline(fg='color1', bg='color2'): 
    return [
        powerline_arrow(fg, bg),
        icon(bg=fg, text='󰃰 '), # Icon: nf-mdi-calendar_clock
        widget.Clock(
            **get_widgetground_colors(bg=fg),
            format='%a %d %b %Y - %H:%M',
            padding=3
        )
    ]

def systray_powerline(fg='dark', bg='color1'): 
    return [
        powerline_arrow(fg, bg),
        widget.Systray(
            background=colors['dark'],
            padding=5
        )
    ]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 15,
    'padding': 1,
}

extension_defaults = widget_defaults.copy()
