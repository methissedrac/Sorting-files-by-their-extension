import os
import shutil
import time

source = "C:\\Users\\[user_name]\\Downloads"
image_dest = "C:\\Users\\[user_name]\\Downloads\\DownloadImage"
archive_dest = "C:\\Users\\[user_name]\\Downloads\\ArchiveFiles"
exe_dest = "C:\\Users\\[user_name]\\Downloads\\exeFiles"
torrent_dest = "C:\\Users\\[user_name]\\Downloads\\torrentFiles"

# Создание папок, если они не существуют
for folder in [image_dest, archive_dest, exe_dest, torrent_dest]:
  if not os.path.exists(folder):
    os.makedirs(folder)

# Бесконечный цикл для перемещения файлов
while True:
  for filename in os.listdir(source):
    filepath = os.path.join(source, filename)
    if os.path.isfile(filepath):
      extension = os.path.splitext(filename)[1].lower()
      if extension in [".jpg", ".png", ".jpeg", ".webp", ".tiff", ".svg", ".eps", ".ai"]:
        shutil.move(filepath, image_dest)
      elif extension == ".zip":
        shutil.move(filepath, archive_dest)
      elif extension in [".exe", ".msi"]:
        shutil.move(filepath, exe_dest)
      elif extension == ".torrent":
        shutil.move(filepath, torrent_dest)

  time.sleep(5)
