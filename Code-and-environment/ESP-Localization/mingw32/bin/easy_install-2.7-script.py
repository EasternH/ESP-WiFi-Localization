#!/usr/bin/env python2.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'setuptools==40.4.3','console_scripts','easy_install-2.7'
__requires__ = 'setuptools==40.4.3'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('setuptools==40.4.3', 'console_scripts', 'easy_install-2.7')()
    )
