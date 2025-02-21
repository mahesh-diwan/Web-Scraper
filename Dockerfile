# Multi-stage Dockerfile for Web Scraper and Hosting Server

# First stage: Scraper (Node.js + Puppeteer)
FROM node:18-slim AS scraper

# Install dependencies and clean up to reduce image size
RUN apt-get update && apt-get install -y chromium 

# Set environment variable to use system Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true 

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy scraper script
COPY scrape.js ./

# Ensure SCRAPE_URL is provided at runtime
ENV SCRAPE_URL=""

# Run scraper at container runtime instead of build time


# Second stage: Hosting Server (Python + Flask)
FROM python:3.10-slim AS server

# Install Node.js for scraping
RUN apt-get update && apt-get install -y nodejs npm chromium

# Set working directory
WORKDIR /app

# Copy necessary files from scraper stage

COPY server.py ./
COPY scrape.js ./
COPY package.json ./
COPY requirements.txt ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt && npm install

# Expose port
EXPOSE 5000

# Start the Flask web server
CMD node scrape.js && python server.py
