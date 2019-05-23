echo -------MSI INSTALL---------------

REM curl -fsS -o bi.exe https://binaries.symless.com/bonjour/bonjoursdksetup.exe

msiexec /i bonjour-installer\Bonjour64.msi /qn /norestart /l*v bonjour-install-log.txt
msiexec /i bonjour-installer\BonjourSDK64.msi /qn /norestart /l*v bonjoursdk-install-log.txt

echo --------LOG DIRECTORIES--------------

echo %CMAKE_PREFIX_PATH%
dir %CMAKE_PREFIX_PATH%
echo %BONJOUR_SDK_HOME%
dir %BONJOUR_SDK_HOME%
echo C:\Program Files\Bonjour SDK\
dir C:\Program Files\Bonjour SDK\
echo C:\Program Files (x86)\Bonjour SDK\
dir C:\Program Files (x86)\Bonjour SDK\

echo -------BUILD---------------

REM /qn /norestart /l*v
REM ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0

mkdir build
cd build
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
cmake -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=Release ..
msbuild synergy-core.sln /p:Platform="x64" /p:Configuration=Release /m
cd ..
copy ext\openssl\windows\x64\bin\* build\

copy C:\Qt\5.9.7\msvc2017_64\bin\Qt5Networkd.dll build\bin\Release\Qt5Networkd.dll
copy C:\Qt\5.9.7\msvc2017_64\bin\Qt5Widgetsd.dll build\bin\Release\Qt5Widgetsd.dll
copy C:\Qt\5.9.7\msvc2017_64\bin\Qt5Guid.dll build\bin\Release\Qt5Guid.dll
copy C:\Qt\5.9.7\msvc2017_64\bin\Qt5Cored.dll build\bin\Release\Qt5Cored.dll
copy C:\Qt\5.9.7\msvc2017_64\bin\Qt5Network.dll build\bin\Release\Qt5Network.dll
copy C:\Qt\5.9.7\msvc2017_64\bin\Qt5Widgets.dll build\bin\Release\Qt5Widgets.dll
copy C:\Qt\5.9.7\msvc2017_64\bin\Qt5Gui.dll build\bin\Release\Qt5Gui.dll
copy C:\Qt\5.9.7\msvc2017_64\bin\Qt5Core.dll build\bin\Release\Qt5Core.dll
copy C:\Qt\5.9.7\msvc2017_64\plugins\platforms\qwindows.dll build\bin\Release\qwindows.dll
