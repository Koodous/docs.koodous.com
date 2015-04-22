git pull
pip install -r requirements.txt --upgrade
mkdocs build --clean
service apache2 reload