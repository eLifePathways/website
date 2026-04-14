.PHONY: dev build backstop-reference backstop-test backstop-approve

dev: node_modules
	npx astro dev

build: node_modules
	npx astro build

node_modules: package.json pnpm-lock.yaml
	pnpm install --frozen-lockfile

backstop-reference: node_modules
	lsof -t -i TCP:4321 -s TCP:LISTEN | xargs kill 2>/dev/null || true; \
	npx astro dev --port 4321 --host & DEV_PID=$$!; \
	until curl -sf http://localhost:4321/ > /dev/null; do sleep 1; done; \
	npx backstop reference --docker; STATUS=$$?; \
	kill $$DEV_PID 2>/dev/null; \
	exit $$STATUS

backstop-approve: node_modules
	npx backstop approve

backstop-test: node_modules
	lsof -t -i TCP:4321 -s TCP:LISTEN | xargs kill 2>/dev/null || true; \
	npx astro dev --port 4321 --host & DEV_PID=$$!; \
	until curl -sf http://localhost:4321/ > /dev/null; do sleep 1; done; \
	npx backstop test --docker; STATUS=$$?; \
	kill $$DEV_PID 2>/dev/null; \
	exit $$STATUS