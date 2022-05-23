import os
import os.path
from os import listdir
from os.path import isfile, join
import shutil
print(os.getcwd())
mypath = os.getcwd()
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
print(onlyfiles)
problem = {}
for file in onlyfiles:
    name = os.path.splitext(file)[0]
    ext = os.path.splitext(file)[1]
    if ext in [".exe", ".bak", ".pas", ".o"]:
        folderPath = os.path.join(mypath,name)
        filePath = os.path.join(mypath,file)
        if name not in problem:
            problem[name] = True
            os.makedirs(folderPath, exist_ok=True)
            print(folderPath, "created")
        shutil.move(filePath, os.path.join(folderPath, file))
