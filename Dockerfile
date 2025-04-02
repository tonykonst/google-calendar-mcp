FROM node:18-alpine

# Устанавливаем необходимые инструменты
RUN apk add --no-cache python3 build-base

WORKDIR /app

# Копируем только package-файлы
COPY package*.json ./

# Устанавливаем зависимости с принудительным игнорированием postinstall
RUN npm install --ignore-scripts

# Копируем все остальные файлы проекта
COPY . .

# Делаем скрипт executable
RUN chmod +x scripts/build.js

# Устанавливаем esbuild глобально
RUN npm install -g esbuild

# Собираем проект принудительно
RUN npm run build

EXPOSE 8080

# Команда запуска
CMD ["npm", "start"]
