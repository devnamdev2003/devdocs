@echo off
echo ===============================
echo Building all mdBook projects
echo ===============================

mdbook build

set BOOKS=aws aws-hands-on cpp javascript mssql python

for %%B in (%BOOKS%) do (
    echo.
    echo -------------------------------
    echo Building %%B
    echo -------------------------------
    cd md-code\%%B
    mdbook build
    cd ../..
)

echo.
echo ===============================
echo All mdBooks built successfully
echo ===============================
pause
