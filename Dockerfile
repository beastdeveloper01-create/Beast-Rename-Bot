# Use full Debian-based Python image (not slim)
FROM python:3.9-buster

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install ffmpeg properly
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first
COPY requirements.txt .

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Run bot
CMD ["python", "bot.py"]
