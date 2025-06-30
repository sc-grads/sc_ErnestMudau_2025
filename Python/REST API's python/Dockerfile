#FROM Python
#EXPOSE 5000
#WORKDIR /app
#RUN pip install flask
#COPY . .
#CMD ["flask","run", "--host", "0.0.0.0"]

# Use the official Python image (lowercase)
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir flask

# Expose port 5000
EXPOSE 5000

# Run the Flask app
#CMD ["python", "app.py"]
CMD ["flask","run", "--host", "0.0.0.0"]