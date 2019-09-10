#!/bin/bash 

# production-ready flask folder structure for an ML app

# create python package from this folder  
touch __init__.py 

# each folder will be a flask endpoint 
mkdir preproc
touch preproc/__init__.py

mkdir train 
touch train/__init__.py

mkdir predict
touch predict/__init__.py

# add gunicorn enabled start up script for Docker container 
cat <<EOT >> boot.sh
#!/bin/sh
exec gunicorn -b :5000 --access-logfile - --error-logfile - app:app
EOT
