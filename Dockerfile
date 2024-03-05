# Base Image
# FROM python:3.13.0a4-slim-bullseye
FROM python:alpine3.19

# Working Directory
WORKDIR /home

# Copy files
COPY . /home

# Install dependencies
RUN pip install flask

# Enviroment setup for flask, as flask by default listens on 5000
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=3000

# Execute when the container starts
CMD [ "flask", "run" ]