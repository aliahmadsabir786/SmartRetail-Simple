FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=config.settings.production

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Paths are relative to the REPO ROOT: this Dockerfile sits in the repo root
# next to manage.py. In Railway leave "Root Directory" EMPTY and set
# "Dockerfile Path" to: Dockerfile
COPY requirements/ requirements/
RUN pip install --no-cache-dir -r requirements/prod.txt

COPY . .

RUN mkdir -p /app/logs /app/staticfiles /app/media

# entrypoint.sh is copied in by the line above. Make it executable and use it as the container's entry.
RUN chmod +x /app/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/app/entrypoint.sh"]