from collections import defaultdict


def load_wordlist(path):
    with open(path, 'r') as f:
        return [word.strip() for word in f.readlines()]


def find_anagrams(words):
    if isinstance(words, str):
        return find_anagrams(words.splitlines())

    anagrams = defaultdict(list)
    for word in words:
        anagrams[''.join(sorted(word))].append(word)
    return list(group for group in anagrams.values() if len(group) > 1)
