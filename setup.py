from distutils.core import setup
import py2exe
import sys, os, site, shutil, time
import platform
import struct

BITS = struct.calcsize("P") * 8

SOURCEDIR = os.getcwd()
DIST_DIR = "%s\\%s%s" % (SOURCEDIR,"dist",BITS)
BUILD_DIR = "%s\\build%s" % (SOURCEDIR,BITS)


setup_dict = dict(
	version = "1.2.3.4",
	name = "main.exe",
	description = "Template Program",
	zipfile = 'template.lib',
	windows=[
		{
			"script":'main.py',
			#"icon_resources" : [(1, 'app.ico')],
			"copyright" : "Copyright Anything",
			"company_name" : "Anything",
		}
	],
	options={
		'build': {'build_base': BUILD_DIR },
		'py2exe': {
		'dist_dir': DIST_DIR,
		'bundle_files' : 3,
		'optimize'     : 1,
		'skip_archive' : False,
		'compressed'   : True,
		'unbuffered'   : False,
		'includes'     : [ 'base64', 'time', 'subprocess', 'zlib', 'requests' ],
		'excludes'     : [ 'tcl','tcl8.5','tk8.5','win32pipe','win32wnet','_tkinter','Tkinter','Tk','_testcapi' ],
		'dll_excludes' : [ 'libgstreamer-1.0-0.dll','MSVCR100.dll','pywintypes27.dll','crypt32.dll','tcl85.dll', 'tk85.dll','DNSAPI.DLL','USP10.DLL','MPR.DLL','MSIMG32.DLL','API-MS-Win-Core-LocalRegistry-L1-1-0.dll','IPHLPAPI.DLL','w9xpopen.exe','mswsock.dll','powrprof.dll' ],
		}
	}
)

setup(**setup_dict)
setup(**setup_dict)