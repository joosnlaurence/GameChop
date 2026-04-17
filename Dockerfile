# Build React frontend
FROM node:20-alpine AS frontend-build
RUN npm install -g pnpm
WORKDIR /app/frontend
COPY frontend/package*.json frontend/pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY frontend/ ./
RUN pnpm run build

# Build Express backend
FROM node:20-alpine AS backend-build
RUN npm install -g pnpm
WORKDIR /app/backend
COPY backend/package*.json backend/pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY backend/ ./
RUN pnpm exec tsc

# Final image
FROM node:20-alpine
RUN npm install -g pnpm
WORKDIR /app

# Copy compiled backend
COPY --from=backend-build /app/backend/dist ./dist
COPY --from=backend-build /app/backend/package*.json /app/backend/pnpm-lock.yaml ./
RUN pnpm install --prod --frozen-lockfile

# Copy Vite build into a folder Express can serve
COPY --from=frontend-build /app/frontend/dist ./public

EXPOSE 3000
CMD ["node", "dist/index.js"]