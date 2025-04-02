FROM node:18-alpine

WORKDIR /app


# 1. Копируем только нужные файлы для установки зависимостей
COPY package*.json ./
COPY scripts/ ./scripts/
COPY . .

# 2. Устанавливаем зависимости (включая postinstall)
RUN npm install

# 4. Собираем проект
RUN npm run build

EXPOSE 8080

CMD ["npm", "start"]

RUN echo "CHECKING SCRIPTS:" && ls -la scripts && node scripts/build.js
