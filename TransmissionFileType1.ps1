   $source = "C:\Users\[имя_пользователя/user name]\Downloads"
   $imageDest = "C:\Users\[имя_пользователя/user name]\Downloads\DownloadImage"
   $archiveDest = "C:\Users\[имя_пользователя/user name]\Downloads\ArchiveFiles"
   $exeDest = "C:\Users\[имя_пользователя/user name]\Downloads\exeFiles"

	
   # Создание папок, если они не существуют

   If (-Not (Test-Path -Path $imageDest)) {
       New-Item -ItemType Directory -Path $imageDest
   }
   If (-Not (Test-Path -Path $archiveDest)) {
       New-Item -ItemType Directory -Path $archiveDest
   }
   If (-Not (Test-Path -Path $exeDest)) {
   New-Item -ItemType Directory -Path $exeDest
   }	


   # Перемещение файлов и бесконечный цикл для работы в фоне

while ($true) {
   Get-ChildItem -Path $source -File | ForEach-Object {
       If ($_.Extension -eq ".jpg" -or $_.Extension -eq ".png" -or $_.Extension -eq ".jpeg" -or $_.Extension -eq ".webp" -or $_.Extension -eq ".tiff" -or $_.Extension -eq ".svg" -or $_.Extension -eq ".eps" -or $_.Extension -eq ".ai") {
           Move-Item -Path $_.FullName -Destination $imageDest
       }
       elseif ($_.Extension -eq ".zip") {
           Move-Item -Path $_.FullName -Destination $archiveDest
       }
       elseif ($_.Extension -eq ".exe" -or $_.Extension -eq ".msi") {
       Move-Item -Path $_.FullName -Destination $exeDest
       }  
   }
   
 # Задержка перед следующей проверкой

    Start-Sleep -Seconds 5
}