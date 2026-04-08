module.exports = async (page, scenario, vp) => {
  await page.evaluate(() => {
    document.querySelector('.site-nav__menu').open = true;
  });
};
