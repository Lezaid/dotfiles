# Theming for Qtile

from settings.utils import StrCustom
from settings.path import qtile_path

from os import path
# import subprocess
import json


def load_theme():
    theme = "dark-grey"

    config = path.join(qtile_path, "config.json")
    if path.isfile(config):
        with open(config) as f:
            theme = json.load(f)["theme"]
    else:
        with open(config, "w") as f:
            f.write(f'{{"theme": "{theme}"}}\n')


    theme_file = path.join(qtile_path, "themes", f'{theme}.json')
    if not path.isfile(theme_file):
        raise Exception(f'"{theme_file}" does not exist')

    with open(path.join(theme_file)) as f:
        return json.load(f)

if __name__ == '__main__':
    load_theme()
else:
    colors = load_theme()

    def get_widgetground_colors(fg='text', bg='dark'): 
        return {
            'foreground': colors[fg],
            'background': colors[bg]
        }

    def get_widget_format(fmt='{}'):
        return {
            'fmt': StrCustom(fmt)
        }
