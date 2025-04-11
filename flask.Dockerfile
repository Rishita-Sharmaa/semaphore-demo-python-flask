FROM registry.semaphoreci.com/python:3.8

# Set up working directory
WORKDIR /opt

# Install dependencies first (caching optimization)
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy application code
COPY . .

# Configure health check
HEALTHCHECK --interval=5s --timeout=2s --retries=5 \
    CMD curl -f http://localhost:5000 || exit 1

# Runtime configuration
EXPOSE 5000
ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=run.py
CMD ["python", "run.py"]