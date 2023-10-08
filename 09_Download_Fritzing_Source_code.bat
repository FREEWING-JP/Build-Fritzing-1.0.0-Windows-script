rem 08_Download_Fritzing_Source_code.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

Path=%cd%\PortableGit\bin;%Path%

echo https://github.com/fritzing/fritzing-app.git
git clone https://github.com/fritzing/fritzing-app.git -b develop

cd fritzing-app
rem Update potis Commits on Jun 3, 2023
rem equivalent Fritzing 1.0.0
git pull origin 6b14cfe9016652e47b5da53ce3d199175736e43e

git show --format='%%H' --no-patch

git rev-parse --git-dir

cd ..

exit

