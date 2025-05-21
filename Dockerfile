# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /usr/src/app

# Copy app and test directories
COPY app/ app/
COPY test/ test/

# Install required packages (if any)
# For now, using only unittest which is built-in

# Run tests
RUN python3 -m unittest discover -s test

# Set default command
CMD ["python3", "app/main.py"]
