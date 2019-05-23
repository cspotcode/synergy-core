echo %CMAKE_PREFIX_PATH%
dir %CMAKE_PREFIX_PATH%
echo %BONJOUR_SDK_HOME%
dir %BONJOUR_SDK_HOME%
echo ----------------------

REM curl -fsS -o bi.exe https://binaries.symless.com/bonjour/bonjoursdksetup.exe

msiexec /i bonjour-installer\BonjourSDK64.msi /qn /norestart /l*v bi-log.txt

echo ----------------------

REM /qn /norestart /l*v
REM ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0

mkdir build
cd build
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
cmake -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=Debug ..
msbuild synergy-core.sln /p:Platform="x64" /p:Configuration=Debug /m
cd ..
copy ext\openssl\windows\x64\bin\* build\