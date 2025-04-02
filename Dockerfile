FROM node:18-alpine
WORKDIR /app

# 1. Копируем сначала все нужные файлы
COPY package*.json ./
COPY scripts/ ./scripts/
COPY src/ ./src/

# 2. Устанавливаем зависимости
RUN npm install

# 3. Копируем остальной код
COPY . .

# 4. Собираем проект
RUN npm run build

EXPOSE 8080
CMD ["npm", "start"]
