
# Basic py2exe Template

## Setup 32/64 Bit Dev-Env:
### 32 Bit Downloads
+ [Python 2.7.12 win32](https://www.python.org/ftp/python/2.7.12/python-2.7.12.msi) (install to C:\Python27)!!!
+ [py2exe 0.6.9 win32](http://sourceforge.net/projects/py2exe/files/py2exe/0.6.9/py2exe-0.6.9.win32-py2.7.exe/download)

### 64 Bit Downloads
+ [Python 2.7.12 win64](https://www.python.org/ftp/python/2.7.12/python-2.7.12.amd64.msi) (install to C:\Python27_64) !!!
+ [py2exe 0.6.9 win64](http://sourceforge.net/projects/py2exe/files/py2exe/0.6.9/py2exe-0.6.9.win64-py2.7.amd64.exe/download)

## Developer Imports: how to run or build from source
### Debug Mode
+ create a link (name: DEBUG32) to debug.bat: edit link, set target:
+ ```X:\????\ovpn-client\debug.bat 32``` and run link as admin!
+ for Debug Mode with more debug messages set target:
+ ```X:\????\ovpn-client\debug.bat 32 DEVMODE```

### Build Mode
+ create a link (name: BUILD32) to build_inno.bat: edit link, set target:
+ ```'X:\????\ovpn-client\build_inno.bat 32``` and run link normally!
+ same for 64 bits and do NOT run any of the *.bat files directly!
+ edit ```set_dirs.bat``` to your needs!
+ Update VERSION only in file: ```release_version.py```
+ Set SIGN in ```release_version.py``` to False for unsigned inno compile

