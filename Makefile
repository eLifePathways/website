.PHONY: dev build docker docker-run

build: node_modules
	npx astro build

docker:
	docker build -t website .

docker-run: docker
	docker run --rm -p 8080:80 website

dev: node_modules
	npx astro dev

node_modules: package.json pnpm-lock.yaml
	pnpm install --frozen-lockfile