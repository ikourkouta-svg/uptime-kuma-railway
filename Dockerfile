FROM louislam/uptime-kuma:latest

# Expose the port that Uptime Kuma runs on
EXPOSE 3001

# The base image already has the correct entrypoint
# Railway will automatically bind to the PORT environment variable
