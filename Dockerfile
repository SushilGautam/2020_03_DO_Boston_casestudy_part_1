FROM python:latest
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN pip install -r requirements.txt
EXPOSE 8222
CMD ["python", "web.py"]
