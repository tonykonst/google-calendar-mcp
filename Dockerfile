FROM node:18-alpine

WORKDIR /app

# Копируем все файлы проекта
COPY . .

# Копируем package-файлы
COPY package*.json ./

# Устанавливаем зависимости с игнорированием postinstall
RUN npm ci --ignore-scripts

# Собираем проект
RUN npm run build

# Открываем порт
EXPOSE 8080

# Команда запуска
CMD ["npm", "start"]
