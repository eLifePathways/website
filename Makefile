.PHONY: dev build preview lint lint-fix prettier check vrt-reference vrt-test vrt-report

VRT_IMAGE := elifepathways-vrt

dev: node_modules
	npx astro dev

build: node_modules
	npx astro build

preview: build
	npx astro preview --allowed-hosts host.docker.internal

lint: node_modules
	npx stylelint 'src/**/*.css'

lint-fix: node_modules
	npx stylelint 'src/**/*.css' --fix

prettier: node_modules
	pnpm prettier --write src/. visual-regression/

check: prettier lint

node_modules: package.json pnpm-lock.yaml
	pnpm install --frozen-lockfile

.vrt-image: Dockerfile.vrt package.json pnpm-lock.yaml
	docker build -f Dockerfile.vrt -t $(VRT_IMAGE) .
	@touch .vrt-image

VRT_RUN = docker run --rm -i \
	--user "$$(id -u):$$(id -g)" \
	--mount type=bind,source="$(CURDIR)/visual-regression",target=/work/visual-regression \
	--add-host=host.docker.internal:host-gateway \
	$(VRT_IMAGE) \
	npx playwright test --config=visual-regression/playwright.config.ts

vrt-reference: node_modules .vrt-image
	lsof -t -i TCP:4321 -s TCP:LISTEN | xargs kill 2>/dev/null || true; \
	npx astro build; \
	npx astro preview --port 4321 --host --allowed-hosts host.docker.internal & PREVIEW_PID=$$!; \
	until curl -sf http://localhost:4321/ > /dev/null; do sleep 1; done; \
	$(VRT_RUN) --update-snapshots; STATUS=$$?; \
	kill $$PREVIEW_PID 2>/dev/null; \
	exit $$STATUS

vrt-test: node_modules .vrt-image
	lsof -t -i TCP:4321 -s TCP:LISTEN | xargs kill 2>/dev/null || true; \
	npx astro build; \
	npx astro preview --port 4321 --host --allowed-hosts host.docker.internal & PREVIEW_PID=$$!; \
	until curl -sf http://localhost:4321/ > /dev/null; do sleep 1; done; \
	$(VRT_RUN); STATUS=$$?; \
	kill $$PREVIEW_PID 2>/dev/null; \
	exit $$STATUS

vrt-report: node_modules
	npx playwright show-report visual-regression/html_report
