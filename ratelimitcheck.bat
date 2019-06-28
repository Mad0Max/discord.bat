@echo off
set isratelimited=0
set filter=.retry_after
%extra%jsonFilter.bat

if [%json%] == [] goto :EOF

echo STATUS 429 RATELIMIT: Wait %json%ms
set /A ratelimittime=%json%/1000+1
echo %ratelimittime%

set isratelimited=1
REM You should not remove this.
timeout /t %ratelimittime% /nobreak