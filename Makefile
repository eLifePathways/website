.PHONY: dev build docker docker-run backstop-reference backstop-test

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

backstop-reference: node_modules
	lsof -ti:4321 | xargs kill 2>/dev/null || true; \
	npx astro dev --port 4321 --host & DEV_PID=$$!; \
	until curl -sf http://localhost:4321 > /dev/null; do sleep 1; done; \
	npx backstop reference --docker; STATUS=$$?; \
	kill $$DEV_PID 2>/dev/null; \
	exit $$STATUS

backstop-test: node_modules
	lsof -ti:4321 | xargs kill 2>/dev/null || true; \
	npx astro dev --port 4321 --host & DEV_PID=$$!; \
	until curl -sf http://localhost:4321 > /dev/null; do sleep 1; done; \
	npx backstop test --docker; STATUS=$$?; \
	kill $$DEV_PID 2>/dev/null; \
	exit $$STATUS