from os import listdir, symlink
from os.path import abspath, basename, expanduser, join

for fn in listdir('.'):
    if fn[0] == '_':
        try:
            symlink(abspath(fn), join(
                expanduser('~/'),
                '.{0}'.format(fn[1:])
            ))
        except OSError:
            print('{0} already exists, skipping.'.format(fn))
        else:
            print('Copied {0}.'.format(fn))
