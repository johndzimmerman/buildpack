# sap_python_buildpack
Very thin and simple buildpack, implemented completely in BASH. Can work both in offline and online mode.

# How it works
* Detect : checks if the app folder contains file runtime.txt containing runtime specification python-<python version>  
* Tries to find python sources \<\<buildpack\>\>/resources/python/Python-$version.tgz
* If not found, downloads https://www.python.org/ftp/python/$version/Python-$version.tgz
* Compiles python sources
* Install python modules \<\<buildpack\>\>/resources/modules/*.tar.gz
* Caches python build to cache folder
* Tries to install dependencies described in \<\<app folder\>\>/requirements.txt using pip
* If it fails, tries to install modules from \<\<app folder\>\>/vendor 

# Offline mode 
This buildpack can work in offline mode i.e. with no internet connection.
All supported python runtimes must be provided as .tgz files in buildpack folder/resources/python folder. So you basically git clone this buildpack, then you download the supported python versions in the resources/python folder and then create the buildpack in CF or in XS

# Online mode
In this case no changes are required to this buildpack, the python version will be downloaded in the compile phase.

# Application prerequisites
Expected files in app folder:
* server.py 
* runtime.txt with sample content "python-3.4.4" or "python-3.5.5"

`cat 'python-3.4.4' >runtime.txt`
* Offline mode: vendor folder containing all dependent modules

Sample commands to download modules:

`python -m pip download -d \<\<app folder\>\>/vendor pyhdb`

`python -m pip install -d \<\<app folder\>\>/vendor -r \<\<app folder\>\>/requirements.txt`
* Online mode: requirements.txt in the app folder


# Limitations
* Hardcoded sap corporate proxy (Removed by Andrew Lunde I830671 for public Internet use.)
* Tested on OS: Ubuntu, Suse linux
* Tested with python versions: 3.4.4  3.5.0
