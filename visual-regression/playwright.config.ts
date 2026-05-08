import { defineConfig } from "@playwright/test";

export default defineConfig({
  testDir: "./tests",
  snapshotDir: "./snapshots",
  outputDir: "./test-results",
  snapshotPathTemplate: "{snapshotDir}/{arg}-{projectName}{ext}",
  reporter: [["html", { outputFolder: "./html_report", open: "never" }]],
  use: {
    baseURL: "http://host.docker.internal:4321",
    browserName: "chromium",
  },
  projects: [
    { name: "mobile", use: { viewport: { width: 320, height: 812 } } },
    { name: "480", use: { viewport: { width: 480, height: 812 } } },
    { name: "640", use: { viewport: { width: 640, height: 812 } } },
    { name: "800", use: { viewport: { width: 800, height: 812 } } },
    { name: "wide", use: { viewport: { width: 1280, height: 800 } } },
  ],
});
