FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependencies
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app
COPY . .

# Run migrations before starting server (optional)
RUN python manage.py makemigrations && python manage.py migrate

# Expose the port Django runs on
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
