FROM node:18-alpine

WORKDIR /app

# Копируем только package-файлы
COPY package*.json ./

# Устанавливаем зависимости без выполнения postinstall
RUN npm ci --ignore-scripts

# Копируем все остальные файлы
COPY . .

# Собираем проект вручную
RUN npm run build

EXPOSE 8080

# Команда запуска
CMD ["npm", "start"]
