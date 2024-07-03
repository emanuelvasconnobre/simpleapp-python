FROM python:3.9.9-alpine3.15

WORKDIR /simpleapp

LABEL Author="Emanuel Vasconcelos <emanuelvanobre@gmail.com"

ADD ./requirements.txt /simpleapp/

RUN pip install -r requirements.txt

ADD . /simpleapp

EXPOSE 8008

CMD [ "python", "app.py" ]
