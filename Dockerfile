# -------- Stage 1: Build --------
FROM node:22.14.0-alpine AS builder


WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

COPY  . .

RUN npm run build

# -------- Stage 2: Runtime --------
FROM node:22.14.0-alpine AS runner

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node --from=builder /home/node/app/dist ./dist
COPY --chown=node:node --from=builder /home/node/app/package*.json ./
USER node
RUN npm install --omit=dev

EXPOSE 5000
ENTRYPOINT ["node", "dist/index.js"]