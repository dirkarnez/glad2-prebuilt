REM run as Administrator
@echo off

set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\bin;^
%DOWNLOADS_DIR%\cmake-3.22.2-windows-x86_64\bin;^
%DOWNLOADS_DIR%\python-3.10.8-amd64-portable;^
%DOWNLOADS_DIR%\python-3.10.8-amd64-portable\Scripts;

@REM set PATH=^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
@REM D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

set CD_LINUX=%CD:\=/%

echo %CD_LINUX%

cd %~dp0

if exist cmake-build rmdir /s /q cmake-build

python -m pip install --upgrade pip
python -m pip install jinja2

cmake.exe ^
-G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_INSTALL_PREFIX="cmake-build/installation" ^
-B./cmake-build &&^
cd cmake-build &&^
cmake --build .  &&^
cmake --install . 
echo done &&^
pause