# -*- coding: utf-8 -*-

"""
This script manages the project files such as notes and code emxamples.

The script have to be run from the root folder.
"""

from pathlib import Path


NOTE_PATH = Path("./notes")
CODE_PATH = Path("./source")


def list_codes() -> tuple[Path]:
    """
    List the code files stored in the `CODE_PATH` directory.
    """
    return tuple([path for path in CODE_PATH.glob("**/*.f90")])


def list_notes() -> tuple[Path]:
    """
    List the note files stored in the `NOTE_PATH` directory.
    """
    return tuple([path for path in NOTE_PATH.glob("**/*.md")])


if __name__ == "__main__":

    codes = list_codes()
    notes = list_notes()

    # Show the code files.
    print("-----\nCODES\n-----")
    for code in codes:
        print(code.name, code.relative_to(code.parent.parent))

    # Show the note files.
    print("-----\nNOTES\n-----")
    for note in notes:
        print(note.name, note.relative_to(note.parent.parent))
