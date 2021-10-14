@ echo off

set path=C:\Rips

echo.

set /p folder= Video Name to be Saved as (No spaces - use underscore between words '-'):

echo.

mkdir C:\Rips\%folder%

set /p stream=Input MPD from stream detector:

N_m3u8DL-CLI_v2.9.7.exe "%stream%" --workDir C:\Rips\%folder% --saveName "stream" --enableDelAfterDone --enableMuxFastStart

ren C:\Rips\%folder%\stream(Audio).* 

ren C:\Rips\%folder%\stream.* stream.mp4

echo.

set /p key=enter key: 

echo.

set /p kid=enter kid: 

echo Video being created.........

mp4decrypt.exe --key %kid%:%key% C:\Rips\%folder%\stream(Audio).eac3 C:\Rips\%folder%\decrypted-audio.eac3

mp4decrypt.exe --key %kid%:%key% C:\Rips\%folder%\stream.mp4 C:\Rips\%folder%\decrypted-video.mp4

mkvmerge.exe -o C:\Rips\Rips\%folder%.mkv C:\Rips\%folder%\decrypted-video.mp4 C:\Rips\%folder%\decrypted-audio.eac3

cls