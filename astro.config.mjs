import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://elifepathways.github.io',
  base: '/website',
  devToolbar: { enabled: false },
  vite: {
    server: {
      allowedHosts: ['host.docker.internal']
    }
  }
});
