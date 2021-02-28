# docker-python

# start a new project 
```
docker run -it -v ${PWD}/data:/app python-django:3.8 django-admin startproject app
```
# docker compose run also can start a project but local folder need mv up 1 level
```
sudo docker-compose run app python manage.py startapp app
```

setting.py
```
import pymysql
pymysql.version_info = (1, 4, 13, "final", 0)
pymysql.install_as_MySQLdb()
```

get env value 
```
import os
DEBUG = bool(int(os.environ.get('DEBUG', 0)))

ALLOWED_HOSTS = []
ALLOWED_HOSTS_ENV = os.environ.get('ALLOWED_HOSTS')
if ALLOWED_HOSTS_ENV:
    ALLOWED_HOSTS.extend(ALLOWED_HOSTS_ENV.split(','))
```

env file
```
#Nginx
NGINX_HOST=localhost

#MySQL 
MYSQL_VERSION=10.5.8
MYSQL_HOST=db
MYSQL_DATABASE=test
MYSQL_ROOT_USER=root
MYSQL_ROOT_PASSWORD=root
MYSQL_USER=dev_test
MYSQL_PASSWORD=dev_test

#PYTHON
#if prod debug = 0
DEBUG=1
SECRET_KEY=secret1234
ALLOWED_HOSTS=127.0.0.1,localhost  
```