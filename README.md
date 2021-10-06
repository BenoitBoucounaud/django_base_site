# django_base_site

A Django classic site to keep basics close.

![Progress](https://progress-bar.dev/30/?title=progress)

## Install and init postgreSQL
To install and init postgreSQL :
``` 
    sudo apt-get install postgresql-12 
    sudo -i -u postgres
    psql
    CREATE ROLE basic_user LOGIN SUPERUSER PASSWORD 'basic_pwd';
    CREATE DATABASE basic_db OWNER basic_user;
    \q
    exit
```
## Init project 
To initialise the project :
```
    source ./run.sh init
```

## Run venv
To run venv : 
```
    source ./run.sh run_venv
```

To exit venv : 
```
    deactivate
```

## Run django server 
To run the server : 
```
    ./run.sh run_server
```

## Admin 
Username : admin  
Email : admin@example.com  
Password : password  