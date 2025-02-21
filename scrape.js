const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
    const url = process.env.SCRAPE_URL || 'https://example.com';

    const browser = await puppeteer.launch({
        args: ['--no-sandbox', '--disable-setuid-sandbox'],
        executablePath: '/usr/bin/chromium'
    });

    const page = await browser.newPage();
    await page.goto(url, { waitUntil: 'domcontentloaded' });

    // Scrape all image URLs
    const images = await page.evaluate(() => {
        return Array.from(document.querySelectorAll('img')).map(img => img.src);
    });

    // Save data
    const data = {
        title: await page.title(),
        heading: await page.evaluate(() => document.querySelector('h1')?.innerText || 'No heading found'),
        images
    };

    fs.writeFileSync('scraped_data.json', JSON.stringify(data, null, 2));

    await browser.close();
})();
