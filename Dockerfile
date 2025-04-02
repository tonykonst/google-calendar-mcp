FROM node:18-alpine

WORKDIR /app

# Копируем только package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости с игнорированием postinstall скриптов
RUN npm ci --ignore-scripts

# Копируем все файлы проекта
COPY . .

# Делаем скрипт executable
RUN chmod +x scripts/build.js

# Собираем проект
RUN npm run build

# Открываем порт
EXPOSE 8080

# Команда запуска
CMD ["npm", "start"]
