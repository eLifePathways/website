.PHONY: dev build docker

build: node_modules
	npx astro build

docker:
	docker build -t website .

dev: node_modules
	npx astro dev

node_modules: package.json pnpm-lock.yaml
	pnpm install --frozen-lockfile