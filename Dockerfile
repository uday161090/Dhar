# 1) Choose a base Python image
FROM python:3.12-slim

# 2) Set the working directory inside the container
WORKDIR /app

# 3) Copy only requirements first (for faster builds)
COPY requirements.txt .

# 4) Install all dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 5) Copy the rest of your Django project into the container
COPY . .

# 6) Expose Django's default port
EXPOSE 8000

# 7) Start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
