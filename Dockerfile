# base image
FROM python:3.8
# Python interpreter flags
ENV PYTHONUNBUFFERED 1  
ENV PYTHONDONTWRITEBYTECODE 1
# compiler and OS libraries
RUN apt-get update \  
  && apt-get install -y --no-install-recommends build-essential libpq-dev \  
  && rm -rf /var/lib/apt/lists/*
# project libraries and user creation
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt \  
    && rm -rf /tmp/requirements.txt \  
    && useradd -U app_user \  
    && install -d -m 0755 -o app_user -g app_user /app/static
# code and user setup
WORKDIR /app
USER app_user:app_user
COPY --chown=app_user:app_user . .
# start server
CMD python manage.py runserver 0.0.0.0:80
