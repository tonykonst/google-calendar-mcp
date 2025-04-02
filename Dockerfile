FROM node:18-alpine

WORKDIR /app

# Копируем всё сразу
COPY . .

# Ставим зависимости (build.js уже может найти src/)
RUN npm install

# Сборка (если надо)
RUN npm run build

EXPOSE 8080
CMD ["npm", "start"]
