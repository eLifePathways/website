import { defineConfig } from "astro/config";

export default defineConfig({
  site: "https://elifepathways.org",
  base: "/",
  devToolbar: { enabled: false },
  vite: {
    server: {
      allowedHosts: ["host.docker.internal"],
    },
  },
});
