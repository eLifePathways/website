module.exports = async (page, scenario, vp) => {
  await page.evaluate(() => {
    window.location.hash = "mobile-nav";
  });
  await new Promise((resolve) => setTimeout(resolve, 300));
};
