mkdir build
cd build
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
cmake -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=Debug ..
msbuild synergy-core.sln /p:Platform="x64" /p:Configuration=Debug /m
cd ..
copy ext\openssl\windows\x64\bin\* build\