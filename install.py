#!/usr/bin/env python
# coding = utf-8
import shutil
import os
import time


home = os.getenv("HOME")
backdir  = "backup_%s" % time.strftime("%Y%m%d_%H%M%S", time.localtime())
settings = [".zshrc", ".tmux.conf", ".nvimrc"]


def backup(file):
    fsrc  = os.path.join(home, file)
    fdist = os.path.join(backdir, file)
    if not os.path.isdir(backdir):
        os.mkdir(backdir)
    if os.path.isfile(fsrc):
        shutil.copyfile(fsrc, fdist)


def copy(file):
    fdist = "%s/%s" % (home, file)
    if os.path.isfile(file):
        shutil.copyfile(file, fdist)
        print "copy %s -> %s" % (file, fdist)


def main():
    for file in settings:
        backup(file)
        copy(file)


if __name__ == "__main__":
    main()
