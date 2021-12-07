#!/usr/bin/env python
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
from typing import DefaultDict, Union
from collections import defaultdict


README = """\
# Programming in modern Fortran

```
  ______
 (_) |
    _|_  __   ,_  _|_  ,_    __,   _  _
   / | |/  \_/  |  |  /  |  /  |  / |/ |
  (_/   \__/    |_/|_/   |_/\_/|_/  |  |_/

 “GOD IS REAL, unless declared INTEGER.”
```

<small>This file is machine-generated. Please, don't edit manually.</small>

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

    python manage.py index   # works
    python manage.py clean   # works
    python manage.py release # todo
"""


Configuration = {
    "note_path": Path("./notes"),
    "code_path": Path("./codes"),
}

NOTE_PATH = Path("./notes")
CODE_PATH = Path("./codes")


def list_files(extension: str, path: Path = ".") -> tuple[Path]:
    """
    List the note files stored in the given path.
    """
    return tuple([_path for _path in path.glob(f"**/*.{extension}")])


def list_codes(path: Path) -> tuple[Path]:
    """
    List the code files stored in the given path.
    """
    return list_files("f90", path)


def list_notes(path: Path) -> tuple[Path]:
    """
    List the note files stored in the given path.
    """
    return list_files("md", path)


def read_note_content(note: Path) -> str:
    ...


def check_note_content(note: str) -> bool:
    ...


def create_codes_and_notes_index(path: str = "."):
    """
    """
    path = Path(path)
    codes: str = "\n".join([f"- {i}" for i in list_codes(CODE_PATH)])
    codes_file = "INDEX.md"
    with open(path / codes_file, mode="w+", encoding="utf-8") as f:
        f.write(f"# Codes\n\n")
        f.write(codes)

    # notes: str = "\n".join([str(i) for i in list_notes()])
    # notes_file = "INDEX_NOTES.md"
    # with open(f"{notes_file}", mode="w+", encoding="utf-8") as f:
    #     f.write(f"# NOTES\n\n")
    #     f.write(notes)


def remove_all_files(extension: str, path: Path = "."):
    """
    Removes all files with the given path with provided extension (the search is recursive).
    """
    if not len(extension):
        raise ValueError("The empty string is a not a valid file extension.")

    for filename in Path(".").glob(f"**/*.{extension}"):
        filename.unlink()


def remove_all_modules(path: Path):
    """Remove all module (`.mod`) files."""
    remove_all_files("mod", path)


def remove_all_objects(path: Path):
    """Remove all object (`.o`) files."""
    remove_all_files("o", path)


def remove_all_executables(path: Path):
    """Remove all executable (`.exe`) files."""
    remove_all_files("exe", path)


# ################################################################### #
#                             Commands                                #
# ################################################################### #

# @todo
# Loging to server via SSH
# Copy all the examples to the given path somewhere in home directory
# Then we can compile the examples with Intel and NVIDIA compilers
# Then run them and catch the outputs of programs or benchmarks.

def index() -> None:
    codes = list_codes(CODE_PATH)
    notes = list_notes(NOTE_PATH)

    create_codes_and_notes_index()

    # Create README.md
    with open("README.md", encoding="utf-8", mode="w+") as _file:
        _file.write(README)


def clean() -> None :
    remove_all_modules(CODE_PATH)
    remove_all_objects(CODE_PATH)
    remove_all_executables(CODE_PATH)
    print("[---CLEANED---]")


def build():
    """
    Compile all sources with `gfortran` and place the resulst in `build` folder.
    """
    import subprocess
    files = [str(_file.absolute()) for _file in Path("source/codes").glob("**/*.f90")]
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
        print(exc.with_traceback())
        sys.exit(1) # FAILURE