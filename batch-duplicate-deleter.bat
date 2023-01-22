@ECHO OFF
ECHO Select the type of the files you want to search for duplicates:
ECHO.
ECHO 1 = Images
ECHO 2 = Music
ECHO 3 = Videos
ECHO 4 = Documents
ECHO.
SET /P TYPE=
ECHO.
IF %TYPE%==1 GOTO= :images
IF %TYPE%==2 GOTO= :music
IF %TYPE%==3 GOTO= :videos
IF %TYPE%==4 GOTO= :docs

:images
ECHO Choose the extension *ex: press 1 for jpg
ECHO.
ECHO 1 = jpg
ECHO 2 = png
ECHO 3 = tiff
ECHO.
SET /P FILE_EXT_INPUT=
IF %FILE_EXT_INPUT%==1 SET FILE_EXT=jpg
IF %FILE_EXT_INPUT%==2 SET FILE_EXT=png
IF %FILE_EXT_INPUT%==3 SET FILE_EXT=tiff
GOTO= :location

:music
ECHO Choose the extension *ex: press 1 for mp3
ECHO.
ECHO 1 = mp3
ECHO 2 = ogg
ECHO 3 = m4a
ECHO.
SET /P FILE_EXT_INPUT=
IF %FILE_EXT_INPUT%==1 SET FILE_EXT=mp3
IF %FILE_EXT_INPUT%==2 SET FILE_EXT=ogg
IF %FILE_EXT_INPUT%==3 SET FILE_EXT=m4a
GOTO= :location

:videos
ECHO Choose the extension *ex: press 1 for mov
ECHO.
ECHO 1 = mov
ECHO 2 = mp4
ECHO 3 = mkv
ECHO.
SET /P FILE_EXT_INPUT=
IF %FILE_EXT_INPUT%==1 SET FILE_EXT=mov
IF %FILE_EXT_INPUT%==2 SET FILE_EXT=mp4
IF %FILE_EXT_INPUT%==3 SET FILE_EXT=mkv
GOTO= :location

:docs
ECHO Choose the extension *ex: press 1 for pdf*
ECHO.
ECHO 1 = pdf
ECHO 2 = odt
ECHO 3 = txt
ECHO.
SET /P FILE_EXT_INPUT=
IF %FILE_EXT_INPUT%==1 SET FILE_EXT=pdf
IF %FILE_EXT_INPUT%==2 SET FILE_EXT=odt
IF %FILE_EXT_INPUT%==3 SET FILE_EXT=txt
GOTO= :location

:location 
SET SEARCH_PATH=.
ECHO.
ECHO Write the location of the folder where the duplicated files will be deleted and press enter
ECHO.
SET /P INPUT= 
ECHO.
ECHO You have selected the following location: 
ECHO.
ECHO %INPUT%
ECHO.
ECHO Press "y" to confirm or "n" to input another location:
ECHO.
SET /P INPUT_2=
ECHO.
IF '%INPUT_2%'=='y' GOTO :finder  
CALL :location

:finder
ECHO I'm looking for duplicate files with the "%FILE_EXT%" extension in the following folder: %INPUT%
sfk dupfind %INPUT% .%FILE_EXT% +del
ECHO Or press any other letter to exit.
SET /p OPTION=
IF '%OPTION%'=='-yes' GOTO :delete
IF '%OPTION%'=='del' GOTO :delete
IF '%OPTION%'=='del!' GOTO :delete
EXIT

:delete
ECHO Deleting duplicate files...
sfk dupfind %INPUT% .%FILE_EXT% +del -yes
PAUSE
