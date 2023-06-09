# voicing_text_in_cmd_20230608
Озвучивание текста в cmd. Упрощенный аналог Балаболки

## 1. Для озвучивания текста с помощью командной строки (cmd) в Windows вы можете использовать встроенную утилиту SAPI.SpVoice. Вот пример команды, которая позволяет озвучить текст:

```shell
mshta vbscript:Execute("CreateObject(""SAPI.SpVoice"").Speak(""Текст для озвучивания: Данная команда взята с https://github.com/pegas365i4/voicing_text_in_cmd_20230608.git"")(window.close)")
```
Чтобы использовать эту команду, выполните следующие шаги:

Откройте командную строку, нажав клавишу Win + R, введите "cmd" и нажмите Enter.
Скопируйте приведенную выше команду и вставьте ее в командную строку.
Замените фразу "Текст для озвучивания" на желаемый текст, который вы хотите озвучить.
Нажмите Enter.
После выполнения команды система озвучит указанный текст. Обратите внимание, что ваш компьютер должен иметь установленный голосовой синтезатор SAPI (Speech API). В большинстве случаев это уже установлено по умолчанию в Windows.

Примечание: Этот метод может работать только в операционных системах Windows и требует наличия SAPI для озвучивания текста.

## 2. Для озвучивания текста из файла .txt с помощью командной строки (cmd) в Windows БЕЗ учета кодировки текста. 
вы можете использовать другие средства, такие как PowerShell или Python, для выполнения более сложных команд.
Вот пример использования PowerShell для озвучивания текста из файла text.txt:
```
powershell -Command "(New-Object -ComObject SAPI.SpVoice).Speak((Get-Content -Raw -Path 'text.txt').Trim())"
```
Приведенная команда использует PowerShell для чтения содержимого файла text.txt, удаления лишних пробелов и переводов строк с помощью метода .Trim(), и передачи текста в SAPI.SpVoice для озвучивания.

Обратите внимание, что для выполнения этой команды требуется наличие PowerShell на вашей системе. Если команда вызывает ошибку, пожалуйста, убедитесь, что PowerShell установлен и доступен в вашей системе.

## 3. Для озвучивания текста из файла .txt с помощью командной строки (cmd) в Windows С УЧЁТОМ кодировки текста для русского языка. 
При озвучивании текста на русском языке с использованием PowerShell и SAPI.SpVoice иногда возникают проблемы с правильной интерпретацией символов и кодировкой. Для того чтобы правильно озвучить текст на русском языке, вам потребуется указать кодировку файла text.txt в команде PowerShell.

Вот пример команды PowerShell, которая учитывает кодировку файла text.txt:
```
powershell -Command "$text = Get-Content -Path 'text.txt' -Encoding UTF8; (New-Object -ComObject SAPI.SpVoice).Speak($text)"
```
В данном примере предполагается, что файл text.txt имеет кодировку UTF-8. Если ваш файл имеет другую кодировку, например, Windows-1251 (Cyrillic), замените -Encoding UTF8 на -Encoding Cyrillic.

Обратите внимание, что в команде PowerShell используется корректное чтение содержимого файла с учетом указанной кодировки. Текст будет озвучиваться с использованием русского языка и правильной кодировки, что поможет избежать проблем с неправильным произношением символов и белебердой.

Если вы все еще сталкиваетесь с проблемами при озвучивании текста на русском языке, убедитесь, что ваша система поддерживает и установлена поддержка русского языка для SAPI.SpVoice.

### Файлы для скачивания:
Эти файлы относятся к п.3:
1. Сначала вставляете необходимый текст в `text.txt`
2. Запускаете `3voicing_text_in_cmd_20230608.bat` и текст озвучивается.

## 4. Если вы хотите озвучивать текст, находящийся в буфере обмена, можно воспользоваться следующим скриптом PowerShell:
```
powershell -Command "$text = Get-Clipboard -Format Text; (New-Object -ComObject SAPI.SpVoice).Speak($text)"
```
В данной команде используется powershell -Command для запуска команды PowerShell в одну строку. С помощью Get-Clipboard -Format Text мы получаем текст из буфера обмена, а (New-Object -ComObject SAPI.SpVoice).Speak($text) выполняет озвучивание этого текста с помощью SAPI.SpVoice.

Выполните следующие действия, чтобы использовать эту команду:

Скопируйте текст в буфер обмена (Ctrl + C).
Откройте командную строку (cmd).
Вставьте команду PowerShell в командную строку.
Нажмите Enter.
Команда получит текст из буфера обмена и озвучит его с помощью SAPI.SpVoice. Обратите внимание, что этот метод предполагает, что у вас установлен PowerShell и настроен доступ к командлетам буфера обмена (Get-Clipboard).

### Файл для скачивания к п.4:
1. Скопируйте текст в буфер обмена.
2. Запускаете `4buffer_text_voicing_in_cmd_20230608.bat` и текст озвучивается.

### 4.1. Читает текст из буфера обмена и произносит его с использованием выбранного голоса и скорости речи.
```bat
powershell -Command "$text = Get-Clipboard -Format Text; $voice = New-Object -ComObject SAPI.SpVoice; $voice.Rate = 10; $voice.Voice = $voice.GetVoices().Item(0); $voice.Speak($text)"
```
Этот `4-1buffer_text_voicing_in_cmd_v20230609.bat` файл запускает команду PowerShell, которая выполняет следующие действия:

1. `$text = Get-Clipboard -Format Text;`: Получает текст, сохраненный в буфере обмена.
2. `$voice = New-Object -ComObject SAPI.SpVoice;`: Создает новый экземпляр объекта SAPI.SpVoice, который позволяет работать с функциями синтеза речи.
3. `$voice.Rate = 10;`: Устанавливает скорость речи на 10. Значение 10 представляет собой относительное ускорение воспроизведения. Можно устанавливать от -10 до 10. Скорость 0 = нормальная скорость.
4. `$voice.Voice = $voice.GetVoices().Item(0);`: Устанавливает голос для синтеза речи. В данном случае используется id=0 голос (т.е. по умолчанию) из списка доступных голосов. [[Как найти список всех возможных голосовых пакетов20230609]]
5. `$voice.Speak($text)`: Произносит текст, сохраненный в переменной `$text`, используя выбранный голос и настроенную скорость речи.

Таким образом, данный .bat файл читает текст из буфера обмена и произносит его с использованием выбранного голоса и скорости речи.

### 4.2. Как сохранить в аудио файл wav 
Чтобы сохранить озвученный текст в аудиофайл, вы можете использовать PowerShell и SAPI.SpVoice с помощью `SPEncode` для сохранения в WAV-формате. Вот пример команды, которая озвучивает текст и сохраняет его в аудиофайл:
```4-2save_to_an_audio_file_v20230609.bat
powershell -Command "$text = Get-Clipboard -Format Text; $voice = New-Object -ComObject SAPI.SpVoice; $voice.Rate = 10; $voice.Voice = $voice.GetVoices().Item(0); $stream = New-Object -ComObject SAPI.SpFileStream; $stream.Open('output.wav', 3, $null); $voice.AudioOutputStream = $stream; $voice.Speak($text); $stream.Close()"
```
В этом примере мы добавили несколько дополнительных строк для сохранения озвученного текста в файл `output.wav`. `$stream = New-Object -ComObject SAPI.SpFileStream; $stream.Open('output.wav', 3, $null);` создает объект `SAPI.SpFileStream` и открывает файл `output.wav` для записи. Затем мы присваиваем `AudioOutputStream` объекту `$voice` для указания, что результат озвучивания должен быть записан в файл `output.wav`. После выполнения озвучивания текста мы закрываем поток записи с помощью `$stream.Close()`.

Выполните следующие действия, чтобы использовать эту команду:

1. Скопируйте текст в буфер обмена (Ctrl + C).
2. Откройте командную строку (cmd).
3. Вставьте команду PowerShell в командную строку.
4. Нажмите Enter.

Команда озвучит текст, сохранит его в аудиофайл `output.wav` и закроет поток записи. Обратите внимание, что перед запуском этой команды убедитесь, что у вас есть права на запись в текущей рабочей директории, где будет создан аудиофайл.
