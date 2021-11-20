@REM Module name should match module file because `.mod` files are named by module name
@REM and object files are named by file name
@REM better to name modules all lowercase because .mod file are craeted lowercased
@REM even when the module name use upparcased letters.
@REM Name clashing: `module_1.o:module_1.f90:(.text+0x0): multiple definition of `__module_1_MOD_hello'`
@REM  name manglig                                                                ^^^^^^^^^^^^^^^^^^^^^

@REM Compile module A
gfortran -c module_1.f90

@REM Compile module B.
gfortran -c module_2.f90

@REM Compile program.
gfortran -I. -c program.f90

@REM Link all together and create executable.
@REM Use `-I` to specify an module (.mod) inlcude path
gfortran module_1.o module_2.o program.o -o program.exe
