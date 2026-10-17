#syntax docker/dockerfile:1
FROM python:3.12 AS builder
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
WORKDIR /app
COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt

FROM python:3.12-slim
ENV PATH="/opt/venv/bin:$PATH" FLASK_APP=hello
COPY --from=builder /opt/venv /opt/venv
WORKDIR /app
COPY . .
EXPOSE 8000
CMD ["flask","run","--host","0.0.0.0","--port","8000"]
