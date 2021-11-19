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

import sys
from pathlib import Path
from typing import DefaultDict
from collections import defaultdict


README = """\
# Programming in Fortran

<small>This file is machine-generated. Please, don't edit manually.</small>

_“GOD IS REAL, unless declared INTEGER.”_

- The notes from lectures are in `notes` directory.
- The codes based on lectures are in `source` directory.
- The codes created on practicals are located in `practicals` directory.

## Build

At this moment, compile each example as

    gfortran source/<file_name.f90> -o build/<file_name>

We are working on Make/CMake support.

To compile a module as an object use

    gfortran -c path/to/module_name.f90 -o module_name

To compile program and link object as an executable use

    gfortran path/to/program path/to/object -o program_name

### What to do with `Error in compiling: Can't open module file`?

You have to compile your module first before an executable as an objects or
you can compile them together but there have to be listed first on command line.

    gfortran path/to/module path/to/program  -o program_name
             ^^^^^^^^^^^^^^ See that modules are compile first!

### What are these `.mod` files?

- https://fortranwiki.org/fortran/show/Compiler+.MOD+files

## Manage

We use Python 3.5+.

    python manage.py index   # work-in-progress
    python manage.py clean   # works
    python manage.py release # todo

## Coding style

We do not repeat the program name or procedure after the `end`  unless it is a very long script.

    program program_name
        implicit none       ! always-use-implicit
        ! code !
    end program             ! no-program-name-here

    function function_name
        implicit none
        ! code !
    end function            ! no-function-name-here

    function module_name
        implicit none
        ! code !
    end module              ! no-function-name-here
"""


Configuration = {
    "note_path": Path("./notes"),
    "code_path": Path("./source"),
}

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


def remove_all_executables():
    """
    Removes all Windows executable (`.exe`) files.
    """
    for filename in Path(".").glob("**/*.exe"):
        filename.unlink()


def remove_all_modules():
    """
    Removes all Fortran module (`.mod`) files.
    """
    for filename in Path(".").glob("**/*.mod"):
        filename.unlink()


def remove_all_objects():
    """
    Removes all object (`.o`) files.
    """
    for filename in Path(".").glob("**/*.o"):
        filename.unlink()

#
# Commands
#

def index():
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

    # Create README.md
    with open("README.md", encoding="utf-8", mode="w+") as _file:
        _file.write(README)


def clean():
    remove_all_modules()
    remove_all_objects()
    remove_all_executables()
    print("[---CLEANED---]")


def build():
    """
    Compile all sources with `gfortran` and place the resulst in `build` folder.
    """
    import subprocess
    files = [str(_file.absolute()) for _file in Path(".").glob("**/*.f90")]
    # (f"{_file.stem}",
    prog = files[0]

    print(prog)
    subprocess.run(["gfortran", prog], shell=True)

    print("[---COMPILED---]")


def main(argv=None) -> None:

    if len(argv) == 1:
        print("No action selected!")
        print("Please write `index`, `clean`, `compile`")
        return

    command: str = argv[1]

    commands = defaultdict(None, {
        "index": index,
        "clean": clean,
        "build": build
    })

    if execute := commands[command]:
        execute()
    else:
        print(f"Unknown command {command}, please")

if __name__ == "__main__":
    try:
        main(sys.argv)
        sys.exit(0) # SUCCESS
    except Exception as exc:
        print(exc)
        sys.exit(1) # FAILURE