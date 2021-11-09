# -*- coding: utf-8 -*-

"""
This script manages the project files such as notes and code emxamples.

The script have to be run from the root folder.

TODO
- Use CMake: I cannot make it work on Windows -- the fortran compiler is not found :( even when I set the right path.
- Compile all code examples.
- Run all code examples and capture their output and show it in the notes!
- We can also compare the outputs from different compilers!
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


def read_note_content(note: Path) -> str:
    ...


def check_note_content(note: str) -> bool:
    ...


def create_codes_and_notes_index():

    codes: str = "\n\n".join([str(i) for i in list_codes()])
    codes_file = "INDEX_CODES.md"
    with open(f"{codes_file}", mode="w+", encoding="utf-8") as f:
        f.write(f"# Codes\n\n")
        f.write(codes)

    notes: str = "\n\n".join([str(i) for i in list_notes()])
    notes_file = "INDEX_NOTES.md"
    with open(f"{notes_file}", mode="w+", encoding="utf-8") as f:
        f.write(f"# NOTES\n\n")
        f.write(notes)


if __name__ == "__main__":

    codes = list_codes()
    notes = list_notes()

    # Show the code files.
    print("--------\n## CODES\n--------")
    for code in codes:
        print(code.name, code.relative_to(code.parent.parent))

    # Show the note files.
    print("--------\n## NOTES\n--------")
    for note in notes:
        print(note.name, note.relative_to(note.parent.parent))

    create_codes_and_notes_index()