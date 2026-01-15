@echo off
echo Available books:
echo 1 - aws
echo 2 - aws-hands-on
echo 3 - cpp
echo 4 - javascript
echo 5 - mssql
echo 6 - python
echo.

set /p choice=Enter book number to serve:

if "%choice%"=="1" set BOOK=aws
if "%choice%"=="2" set BOOK=aws-hands-on
if "%choice%"=="3" set BOOK=cpp
if "%choice%"=="4" set BOOK=javascript
if "%choice%"=="5" set BOOK=mssql
if "%choice%"=="6" set BOOK=python

if not defined BOOK (
    echo Invalid selection
    pause
    exit /b
)

echo.
echo Serving %BOOK%
cd md-code\%BOOK%
mdbook serve
