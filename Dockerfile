FROM node:18-alpine

WORKDIR /app

# Копируем только необходимые файлы для установки зависимостей
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci

# Копируем все остальные файлы
COPY . .

# Устанавливаем права на выполнение скрипта build.js
RUN chmod +x scripts/build.js

# Собираем проект
RUN npm run build

EXPOSE 8080

# Команда запуска
CMD ["npm", "start"]
