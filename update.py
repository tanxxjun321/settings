#!/usr/bin/env python
# coding = utf-8
import shutil
import os
import time


home = os.getenv("HOME")
backdir  = "backup_%s" % time.strftime("%Y%m%d_%H%M%S", time.localtime())
settings = [".zshrc", ".tmux.conf", ".nvimrc"]


def update(file):
    fsrc = "%s/%s" % (home, file)
    if os.path.isfile(fsrc):
        shutil.copyfile(fsrc, file)
        print "copy %s -> %s" % (fsrc, file)


def main():
    for file in settings:
        update(file)


if __name__ == "__main__":
    main()
