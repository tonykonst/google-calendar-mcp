FROM node:18-alpine

WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci

# Копируем все файлы проекта
COPY . .

# Собираем проект
RUN npm run build

# Открываем порт
EXPOSE 8080

# Команда запуска - используем build/index.js
CMD ["npm", "start"]
