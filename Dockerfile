# Use an official Python runtime as a parent image
FROM python:3.10

# Set environment variables to avoid Python buffering issues
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire webapp directory into the container at /app
COPY . /app/

# Expose port 8000 for the Django app
EXPOSE 8000

# Command to run the Django application
CMD ["python", "webapp/manage.py", "runserver", "0.0.0.0:8000"]

