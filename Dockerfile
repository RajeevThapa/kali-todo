# Base Image
FROM python:3.13.0a4-slim-bullseye

# Working Directory
WORKDIR /home

# Install Dependencies
RUN pip install flask

# Copy files
COPY . /home/

# Enviroment setup for flask, as flask by default listens on 5000
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=3000

# Execute when the container starts
CMD [ "flask", "run" ]