@echo off
setlocal enableDelayedExpansion
set /a n=%~1
for /l %%b in (0,1,31) do (
  set /a "d=n&1, n>>=1"
  set binary=!d!!binary!
)
for /f "tokens=* delims=0" %%a in ("!binary!") do set binary=%%a
(
  if "%~2" neq "" (set %~2=%binary%) else echo %binary%
)