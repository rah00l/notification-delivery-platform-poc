# Use official Ruby image
FROM ruby:3.2

# Set working directory
WORKDIR /app

# Copy all project files into container
COPY . .

# Install required gem(s) directly
RUN gem install sqlite3

# Default command to run POC
CMD ["ruby", "main.rb"]
