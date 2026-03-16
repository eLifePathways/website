.PHONY: dev
dev: node_modules
	npx astro dev

node_modules: package.json pnpm-lock.yaml
	pnpm install --frozen-lockfile