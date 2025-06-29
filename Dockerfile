FROM python:3.11-slim

WORKDIR /app

# Install system dependencies for PDF and other file formats
RUN apt-get update && apt-get install -y \
    libpoppler-cpp-dev \
    poppler-utils \
    tesseract-ocr \
    libreoffice \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install markitdown with all dependencies
RUN pip install --no-cache-dir markitdown[all]

COPY . .

CMD ["python", "-m", "markitdown", "--help"]