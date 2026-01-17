@echo off
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
