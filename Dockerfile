FROM python:3.9-slim

WORKDIR /app

# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

RUN pip install flask gunicorn google-api-python-client google-auth google-auth-oauthlib

COPY . .

EXPOSE 8080

CMD ["python", "main.py"]
