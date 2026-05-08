import { test, expect } from "@playwright/test";

const PAGES = [
  { path: "/", name: "home" },
  { path: "/about", name: "about" },
  { path: "/solutions", name: "solutions" },
  { path: "/partnerships", name: "partnerships" },
  { path: "/blog", name: "blog-listing" },
  { path: "/blog/post-07-05-25/", name: "blog-page" },
  { path: "/#mobile-nav", name: "mobile-nav", projects: ["mobile"] },
];

for (const spec of PAGES) {
  test(spec.name, async ({ page }, testInfo) => {
    if (spec.projects) test.skip(!spec.projects.includes(testInfo.project.name));
    await page.goto(spec.path);
    await expect(page).toHaveScreenshot(`${spec.name}.png`);
  });
}
