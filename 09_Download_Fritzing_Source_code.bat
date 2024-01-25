@echo off
rem 08_Download_Fritzing_Source_code.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

Path=%cd%\PortableGit\bin;%Path%

echo https://github.com/fritzing/fritzing-app.git
git clone https://github.com/fritzing/fritzing-app.git -b develop

cd fritzing-app
rem Update potis Commits on Jun 3, 2023
rem equivalent Fritzing 1.0.0
rem git pull origin 6b14cfe9016652e47b5da53ce3d199175736e43e

rem equivalent Fritzing 1.0.1 Sep 6, 2023
rem git pull origin 8f5f1373835050ce014299c78d91c24beea9b633
rem git checkout 8f5f1373835050ce014299c78d91c24beea9b633

rem equivalent Fritzing 1.0.2 Dec 20, 2023
git pull origin dbdbe34c843677df721c7b3fc3e32c0f737e7e95
git checkout dbdbe34c843677df721c7b3fc3e32c0f737e7e95

rem add git tag 1.0.2
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git tag -a 1.0.2 -m "" dbdbe34c843677df721c7b3fc3e32c0f737e7e95

git show --format='%%H' --no-patch

git rev-parse --git-dir

cd ..

exit

