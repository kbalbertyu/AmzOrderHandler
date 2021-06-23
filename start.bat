@echo off

cd %~dp0

git pull origin master

taskkill /f /im SuperLabour.exe
start SuperLabour.exe
timeout 7