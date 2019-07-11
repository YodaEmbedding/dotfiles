from __future__ import (absolute_import, division, print_function)
from ranger.api.commands import Command

def select_file_by_command(self, command):
    import subprocess
    import os.path
    comm = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
    stdout, _stderr = comm.communicate()
    if comm.returncode != 0:
        return
    fzf_file = os.path.abspath(stdout.rstrip('\n'))
    if os.path.isdir(fzf_file):
        self.fm.cd(fzf_file)
    else:
        self.fm.select_file(fzf_file)

class fzf(Command):
    """
    :fzf

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        if self.quantifier:
            # match only directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        select_file_by_command(self, command)

class frece_dir(Command):
    """
    :frece_dir

    Find a folder using fzf and frece.
    """

    def execute(self):
        command = '''
        DB_FILE="$HOME/.frece_dir.db"
        item=$(frece print "$DB_FILE" | fzf)
        [[ -z $item ]] && exit 1
        frece increment "$DB_FILE" "$item"
        echo "$item"
        '''
        select_file_by_command(self, command)
