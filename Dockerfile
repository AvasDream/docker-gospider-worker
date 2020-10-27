FROM golang:latest

RUN mkdir /tools
RUN mkdir /code
ENV toolsdir="tools"

RUN apt update &&\
    apt install git &&\
    go get -u github.com/jaeles-project/gospider &&\
    apt install python3 python3-pip -y 

RUN pip3 install python-telegram-bot --upgrade


COPY message.py /code/message.py
COPY telegram.token /code/telegram.token
COPY telegram.id /code/telegram.id
COPY main.sh /code/main.sh
RUN chmod +x /code/main.sh

ENTRYPOINT [ "/code/main.sh" ]