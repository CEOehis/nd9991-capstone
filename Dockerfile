FROM node:13

# Create the app directory
WORKDIR /app

# Copy app
COPY api/ /app

# Install dependencies
RUN npm i

EXPOSE 8080

CMD ["npm", "start"]
