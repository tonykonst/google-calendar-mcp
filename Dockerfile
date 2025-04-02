FROM node:18-alpine

WORKDIR /app

# Копируем только package-файлы
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci

# Копируем все остальные файлы
COPY . .

# Делаем скрипт executable
RUN chmod +x scripts/build.js

# Собираем проект
RUN npm run build

EXPOSE 8080

# Команда запуска
CMD ["npm", "start"]
