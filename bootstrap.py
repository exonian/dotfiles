from os import listdir, symlink
from os.path import abspath, basename, expanduser, join

for fn in listdir('.'):
    if fn[0] == '_':
        print('{0}'.format(fn))
        try:
            symlink(abspath(fn), join(
                expanduser('~/'),
                '.{0}'.format(fn[1:])
            ))
        except OSError:
            print('{0} already exists, skipping.'.format(fn))
