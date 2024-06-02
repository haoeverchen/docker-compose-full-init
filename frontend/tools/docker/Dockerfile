# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

COPY . .

# Install Angular CLI
RUN npm install -g @angular/cli
# Install project dependencies
RUN npm install
# Expose the port on which the app will run
EXPOSE 4200
# Start the app
CMD ["ng", "serve", "--host", "0.0.0.0"]