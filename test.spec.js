const { test, expect } = require('@playwright/test');
const chai = require('chai');
const chaiFiles = require('chai-files');

chai.use(chaiFiles);
test.use({ viewport: { width: 1280, height: 1024 } });

test('Base test', async ({ page, browserName }) => {
    await page.goto('https://example.com');
    await expect(page).toHaveTitle(/Example/);
    console.log(await page.evaluate(() => navigator.userAgent));
    await page.screenshot({ path: `example_${browserName}.png` });
    chai.expect(chaiFiles.file(`example_${browserName}.png`)).to.exist;
});