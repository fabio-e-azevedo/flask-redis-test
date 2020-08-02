FROM python:3.8-alpine

WORKDIR /code

ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0

COPY . .

RUN apk add --no-cache --virtual build-deps gcc musl-dev linux-headers && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del build-deps

EXPOSE 5000

CMD ["flask", "run"]
