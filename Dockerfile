FROM node:18-alpine

WORKDIR /app

# Копируем все файлы проекта сразу, включая скрипты
COPY . .

# Устанавливаем зависимости с игнорированием postinstall скриптов
RUN npm ci --ignore-scripts

# Делаем скрипт executable
RUN chmod +x scripts/build.js

# Собираем проект
RUN npm run build

# Открываем порт
EXPOSE 8080

# Команда запуска
CMD ["npm", "start"]
