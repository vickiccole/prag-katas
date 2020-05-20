#!/usr/bin/env python3

from anagrams import find_anagrams, load_wordlist
import fileinput
import sys

if __name__ == '__main__':
    wordlist = []
    for line in fileinput.input(mode='rb'):
        try:
            wordlist.append(line.decode('utf8').strip())
        except UnicodeDecodeError:
            print("Can't decode utf8:", line, file=sys.stderr)

    for group in find_anagrams(wordlist):
        print(" ".join(group))
