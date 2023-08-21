FROM python:3.8

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN apt-get install ca-certificates
RUN update-ca-certificates
RUN export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
COPY . .

CMD [ "python3", "-m" , "gunicorn", "app:app"]
EXPOSE 8000