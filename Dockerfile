FROM node:18-alpine

WORKDIR /app

# Копируем package-файлы
COPY package*.json ./

# Устанавливаем зависимости с игнорированием postinstall
RUN npm ci --ignore-scripts

# Копируем все файлы проекта
COPY . .

# Собираем проект
RUN npm run build

# Открываем порт
EXPOSE 8080

# Команда запуска
CMD ["npm", "start"]
