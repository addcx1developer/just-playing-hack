# Use the official HHVM image
FROM hhvm/hhvm-proxygen:latest

# Create a non-root user
RUN useradd -ms /bin/bash hhvmuser

# Set working directory
WORKDIR /var/www

# Copy project files
COPY . /var/www

# Change ownership of /var/www to hhvmuser
RUN chown -R hhvmuser:hhvmuser /var/www

# Switch to non-root user
USER hhvmuser

# Expose port
EXPOSE 8080

# Default command: run HHVM web server
CMD ["hhvm", "-m", "server", "-p", "8080"]