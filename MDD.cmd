@ECHO OFF
REM Make Dated Directory
REM Creates a subdirectory in the present working directory
REM with current date as name (as YYYY-MM-DD) in Windows Vista/7/8.1/10 

FOR /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
REM SET ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%
SET ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%
REM ECHO Local date is [%ldt%]

IF NOT EXIST .\%ldt% (
	MD %ldt%

	IF EXIST .\%ldt% (
	ECHO.
	ECHO %ldt% Created.
	ECHO.
	GOTO :EOF
	)
ECHO.
ECHO Failed: Cannot make a directory.
ECHO.
GOTO :EOF
)
ECHO.
Echo %ldt% already exist.
ECHO.
:EOF
