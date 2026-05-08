import { defineConfig } from "astro/config";
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: "https://elifepathways.org",
  base: "/",
  devToolbar: { enabled: false },
  vite: {
    server: {
      allowedHosts: ["host.docker.internal"],
    },
  },
  integrations: [sitemap()],
});
