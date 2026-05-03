# Build the Frontend into Backend/public

FROM node:20-alpine as frontend-builder

WORKDIR /workspace

COPY ./Frontend ./Frontend
COPY ./Backend ./Backend

WORKDIR /workspace/Frontend

RUN npm install

RUN npm run build

# Build the Backend
FROM node:20-alpine

COPY ./Backend /app

WORKDIR /app

RUN npm install

COPY --from=frontend-builder /workspace/Backend/public /app/public

CMD ["node", "server.js"]
