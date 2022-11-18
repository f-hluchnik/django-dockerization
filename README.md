# Jak dockerizovat Django aplikaci

## 1. prerekvizity

	* nainstalovaný Docker (https://docs.docker.com/get-docker/)
	* nainstalovaný nástroj docker-compose (https://docs.docker.com/compose/)
	* soubor `.env`
	* soubor `.dockerignore`

### 1.1 soubor `.env`

	* Vytvoříme soubor `.env` (například `vim .env`).
	* Do tohoto souboru zapíšeme environmentální proměnné ve tvaru `KEY=VALUE`.

### 1.2 soubor `.dockerignore`

	* Vytvoříme soubor `.dockerignore`.
	* Do tohoto souboru zapíšeme soubory nebo masky souborů, které nepotřebujeme
	  v image, v našem případě jde hlavně o `.git`.

## 2 příprava souboru `settings.py`

	* zkontrolujeme, zda správně importujeme environmentální proměnné:
		```SECRET_KEY = os.environ['SECRET_KEY']```
		```DEBUG = os.environ['DEBUG_VALUE']```

## 3 `Dockerfile` a `docker-compose.yml`

	* Do kořenového adresáře projektu vložíme soubory `Dockerfile` a `docker-compose.yml`

## 4 spuštění aplikace

	* Aplikaci spustíme příkazem ```docker-compose --env-file .env up --build```.
