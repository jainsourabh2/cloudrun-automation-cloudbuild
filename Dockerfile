# Dockerfile

# Stage 1: Base Image
# Use an official lightweight Python image as the base
FROM python:3.11-slim

# Stage 2: Environment Setup
# Set the working directory inside the container to /app
WORKDIR /app

# Stage 3: Dependency Installation
# Copy the requirements file into the container's working directory
COPY requirements.txt .

# Install the Python dependencies using pip
# The '--no-cache-dir' option reduces the image size
RUN pip install --no-cache-dir -r requirements.txt

# Stage 4: Application Code
# Copy the entire application code (app.py) from the host to the container
COPY . .

# Stage 5: Networking Configuration
# Expose the port the application runs on (8080 in this example)
# This is documentation, it doesn't actually publish the port
EXPOSE 8080

# Stage 6: Startup Command
# Define the command to run the application when the container starts
# Use the executable form (list of strings) for better compatibility
CMD ["python", "app.py"]
