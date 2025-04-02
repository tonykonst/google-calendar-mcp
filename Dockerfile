FROM node:18-alpine

WORKDIR /app

# 1. Копируем только нужные файлы для установки зависимостей
COPY package*.json ./
COPY scripts/ ./scripts/   # обязательно добавить эту строку!

# 2. Устанавливаем зависимости (включая postinstall)
RUN npm install

# 3. Копируем остальной проект
COPY . .

# 4. Собираем проект
RUN npm run build

EXPOSE 8080

CMD ["npm", "start"]
