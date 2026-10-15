# syntax docker/dockerfile:1
FROM python:3.12-slim
WORKDIR /
RUN pip install flask==3.0.*
COPY hello.py /
ENV FLASK_APP=hello
EXPOSE 8000
CMD ["flask","run","--host","0.0.0.0","--port","8000"]

