FROM node:18-alpine
WORKDIR /app

# 1. Копируем package.json и скрипты (они нужны для postinstall)
COPY package*.json ./
COPY scripts/ ./scripts/

# 2. Устанавливаем зависимости
RUN npm install

# 3. Копируем остальной код
COPY . .

# 4. Собираем проект
RUN npm run build

EXPOSE 8080
CMD ["npm", "start"]
