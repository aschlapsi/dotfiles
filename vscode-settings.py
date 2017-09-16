#!/usr/bin/env python3

import os
import platform
import shutil


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
VS_SETTINGS_SRC_PATH = os.path.join(SCRIPT_DIR, 'vscode')


# https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations
if platform.system() == 'Windows':
    VS_SETTINGS_DST_PATH = os.path.expandvars("%APPDATA%\\Code\\User\\")
elif platform.system() == 'Darwin':
    VS_SETTINGS_DST_PATH = os.path.expandvars("$HOME/Library/Application Support/Code/User/")
elif platform.system() == 'Linux':
    VS_SETTINGS_DST_PATH = os.path.expandvars("$HOME/.config/Code/User/")
else:
    raise NotImplementedError


def link_file(file_name):
    dst_file_path = os.path.join(VS_SETTINGS_DST_PATH, file_name)
    src_file_path = os.path.join(VS_SETTINGS_SRC_PATH, file_name)
    bak_file_path = dst_file_path + '.bak'
    if os.path.exists(bak_file_path):
        os.remove(dst_file_path)
    else:
        os.rename(dst_file_path, bak_file_path)
    os.symlink(src_file_path, dst_file_path)


def main():
    choice = ''
    while choice != 'y' and choice != 'n':
        choice = input('symlink %r(settings.json|keybindings.json) => %r(settings.json|keybindings.json) ? (y/n) ' % (VS_SETTINGS_SRC_PATH, VS_SETTINGS_DST_PATH))
        if choice == 'n':
            os.abort(1)

    link_file('settings.json')
    link_file('keybindings.json')


if __name__ == '__main__':
    main()
