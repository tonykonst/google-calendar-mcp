FROM node:18-alpine

WORKDIR /app

# Сначала только package*.json и scripts/, чтобы использовать кеш
COPY package*.json ./
COPY scripts/ scripts/

# Установка зависимостей без postinstall
RUN npm ci --ignore-scripts

# Копируем остальные файлы проекта
COPY . .

# Запускаем сборку (она уже вызовет build.js через npm run build)
RUN npm run build

EXPOSE 8080

CMD ["npm", "start"]
