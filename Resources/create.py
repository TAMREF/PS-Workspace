#!/usr/bin/python3

import os
import sys
import shutil
import argparse
from pathlib import Path

root_path = Path(__file__).parent.parent.absolute()


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


def main(args):
    dir_path = root_path / 'Practice'
    if args.platform:
        dir_path /= args.platform.capitalize()

    if not dir_path.exists():
        eprint('Wrapping directory %s does not exists. Creating now.' % dir_path)
        dir_path.mkdir(parents=True)
    
    template_path = root_path / 'Resources' / ('%s.cpp' % args.template)

    name = args.id + '.cpp'
    file_path = dir_path / name

    if file_path.exists():
        eprint("The file %s already exists. No action required." % name)
    else:
        eprint("Creating %s from %s template." % (name, template_path.stem))
        shutil.copy(str(template_path), str(file_path))
    
    print(str(file_path))
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser('Create new problem file', description='Makes "Practice/<id>_<platform>.cpp" from "Resources/<template>.cpp"')
    parser.add_argument('-id', required=True)
    parser.add_argument('-pl', '--platform', required=False, type=str)
    parser.add_argument('-tm', '--template', required=False, default='standard', type=str)
    args = parser.parse_args()
    main(args)

