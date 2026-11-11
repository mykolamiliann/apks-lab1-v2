@echo off
setlocal
call npm install || exit /b %errorlevel%
call npm run build || exit /b %errorlevel%
call npm test || exit /b %errorlevel%