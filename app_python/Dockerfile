FROM python:3.8-alpine

WORKDIR /

RUN pip3 install pip==19.0.3 --no-cache-dir

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt --no-cache-dir
COPY ./app .

RUN adduser -D user
USER user

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
CMD [ "uvicorn", "index:app", "--reload", "--host", "0.0.0.0"]