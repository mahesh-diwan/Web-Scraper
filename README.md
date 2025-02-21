# Web Scraper & Hosting Server

## Overview
This project is a **web scraper** built using **Node.js & Puppeteer** that extracts text, links, URLs, and images from a specified website. The scraped data is then hosted using a **Flask web server** in **Python**. The entire application is containerized using **Docker** with a multi-stage build to keep the final image lightweight.

## Features
- **Scrapes text, URLs, links, and images** from any website.
- **Uses Puppeteer & Chromium** for web automation.
- **Flask API** serves the scraped data as JSON.
- **Multi-stage Docker build** to keep the image small.
- **Dynamic URL input** through environment variables.

---

## Setup & Installation
### Prerequisites
- Docker installed on your machine ([Get Docker](https://docs.docker.com/get-docker/))
- Git installed ([Get Git](https://git-scm.com/downloads))

### Clone the Repository
```sh
git clone https://github.com/mahesh-diwan/Web-Scraper.git
cd Web-Scraper
```

---

## Building the Docker Image
To build the Docker image, run:
```sh
docker build -t web-scraper .
```
This will create a containerized application with both the **web scraper** and the **Flask API**.

---

## Running the Application
### **Run with a Custom URL**
You can specify a **website to scrape** using an environment variable:
```sh
docker run -e SCRAPE_URL="https://example.com" -p 5000:5000 web-scraper
```
This will scrape `https://example.com` and serve the extracted data at `http://localhost:5000`.

### **Access the Scraped Data**
Once the container is running, visit:
```sh
http://localhost:5000
```
This will return a JSON response containing the **title, text, links, and images** extracted from the specified webpage.

---

## File Structure
```
Web-Scraper/
│── Dockerfile          # Multi-stage Docker build
│── scrape.js           # Node.js script to scrape websites using Puppeteer
│── server.py           # Flask server to serve scraped data
│── package.json        # Node.js dependencies
│── requirements.txt    # Python dependencies
│── README.md           # Documentation
```

---

## Stopping & Removing the Container
To stop the running container, first find the **container ID**:
```sh
docker ps
```
Then stop it using:
```sh
docker stop <container_id>
```
To remove the container:
```sh
docker rm <container_id>
```

---

## Author
**Mahesh Diwan**  
GitHub: [@mahesh-diwan](https://github.com/mahesh-diwan)

