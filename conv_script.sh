#!/bin/bash

# Проверяем, указан ли входной файл
if [ $# -eq 0 ]; then
    echo "Использование: $0 <входной_файл.pdf>"
    exit 1
fi

# Задаем имя входного файла
input_file="$1"

# Задаем имя выходного файла
output_file="${input_file%.*}_fixed.pdf"

# Проверяем, установлен ли Ghostscript
if ! command -v gs &> /dev/null; then
    echo "Ошибка: Ghostscript не установлен. Пожалуйста, установите Ghostscript и попробуйте снова."
    exit 1
fi

# Конвертируем PDF с помощью Ghostscript
gs -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$output_file" "$input_file"

echo "Файл '$input_file' успешно перекодирован и сохранен как '$output_file'."
