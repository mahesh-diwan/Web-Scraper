# DevOps Assessment - Web Scraping with Node.js & Flask

## 🛠 Technologies Used
- **Node.js (Puppeteer)** for web scraping
- **Python (Flask)** for hosting scraped content
- **Docker Multi-Stage Build** for containerization

## 🚀 Setup & Usage

### **Build Docker Image**
```bash
docker build -t devops-assessment .
docker run -p 5000:5000 -e SCRAPE_URL="https://example.com" devops-assessment
```
Aess the Scraped Data
Visit:http://localhost:5000


---

## **📌 Deliverables**
| File | Description |
|------|------------|
| `scrape.js` | Node.js script using Puppeteer for web scraping |
| `server.py` | Python Flask script to host the scraped content |
| `Dockerfile` | Multi-stage build Dockerfile |
| `package.json` | Node.js dependencies |
| `requirements.txt` | Python dependencies |
| `README.md` | Documentation on setup and usage |

---

## **📌 Evaluation Criteria**
✅ **Correctness**: Application should scrape data & serve it via Flask.  
✅ **Modularity**: Clean separation between scraper & hosting stages.  
✅ **Documentation**: README should explain everything clearly.  

---

### **🎯 Final Steps**
- Ensure the **Docker image size is optimized**.
- Test the **container on different URLs**.
- Double-check that **all files are committed to GitHub**.

This **step-by-step guide** ensures you **successfully complete the DevOps assessment** and **deliver all required files** ✅. Let me know if you need further clarification! 🚀

