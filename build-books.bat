@echo off
echo ===============================
echo Cleaning docs folder (contents only)

REM If docs exists, delete everything inside it
if exist docs (
    del /q docs\* 2>nul
    for /d %%D in (docs\*) do rmdir /s /q "%%D"
    echo Docs folder cleared
) else (
    mkdir docs
    echo Docs folder created
)
echo ===============================

echo.
echo ===============================
echo Building all mdBook projects
echo ===============================

REM Loop through all folders inside md-code
for /d %%B in (md-code\*) do (
    echo.
    echo -------------------------------
    echo Building %%~nxB
    echo -------------------------------
    cd "%%B"
    mdbook clean
    mdbook build
    cd ../..
)

echo.
echo ===============================
echo All mdBooks built successfully
echo ===============================
pause
