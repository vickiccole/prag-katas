import os
import pytest
import tempfile

from anagrams import find_anagrams, load_wordlist


@pytest.fixture
def example():
    words = [
        "kinship",
        "pinkish",
        "enlist",
        "inlets",
        "listen",
        "silent",
        "boaster",
        "boaters",
        "borates",
        "fresher",
        "refresh",
        "sinks",
        "skins",
        "knits",
        "stink",
        "rots",
        "sort"
    ]

    anagrams = [
        ["kinship", "pinkish"],
        ["enlist", "inlets", "listen", "silent"],
        ["boaster", "boaters", "borates"],
        ["fresher", "refresh"],
        ["sinks", "skins"],
        ["knits", "stink"],
        ["rots", "sort"],
    ]
    return (words, anagrams)


def sort(anagrams):
    return sorted(sorted(group) for group in anagrams)


def test_anagram_finder(example):
    wordlist, answers = example
    anagrams = find_anagrams(wordlist)
    assert sort(anagrams) == sort(answers)


def test_anagram_finder_given_a_string(example):
    wordlist, answers = example
    anagrams = find_anagrams("\n".join(wordlist))
    assert sort(anagrams) == sort(answers)


def test_anagram_finder_given_a_windows_string(example):
    wordlist, answers = example
    anagrams = find_anagrams("\r\n".join(wordlist))
    assert sort(anagrams) == sort(answers)


def test_anagram_finder_given_a_file(example):
    wordlist, answers = example
    try:
        fd, path = tempfile.mkstemp(text=True)
        with open(path, 'w') as f:
            for word in wordlist:
                f.write(word + '\n')

        anagrams = find_anagrams(load_wordlist(path))
        assert sort(anagrams) == sort(answers)
    finally:
        os.close(fd)
        os.unlink(path)
