FROM node:22-alpine AS builder

RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN npx astro build

FROM caddy:2-alpine

COPY --from=builder /app/dist /usr/share/caddy

EXPOSE 80
