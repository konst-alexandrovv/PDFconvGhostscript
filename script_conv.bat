@echo off

rem Проверяем, указан ли входной файл
if "%~1"=="" (
    echo Использование: %~nx0 <входной_файл.pdf>
    exit /b 1
)

rem Задаем имя входного файла
set "InputFile=%~1"

rem Задаем имя выходного файла
set "OutputFile=%~dpn1_fixed.pdf"

rem Проверяем, установлен ли Ghostscript
set "GhostscriptPath=C:\Program Files\gs\gs*\bin\gswin64c.exe"
if not exist "%GhostscriptPath%" (
    echo Ошибка: Ghostscript не установлен. Пожалуйста, установите Ghostscript и попробуйте снова.
    exit /b 1
)

rem Конвертируем PDF с помощью Ghostscript
"%GhostscriptPath%" -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile="%OutputFile%" "%InputFile%"

echo Файл '%InputFile%' успешно перекодирован и сохранен как '%OutputFile%'.
