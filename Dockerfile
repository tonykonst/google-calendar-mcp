FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

# Устанавливаем зависимости без postinstall
RUN npm ci --ignore-scripts

COPY . .

# Собираем проект
RUN npm run build

EXPOSE 8080

CMD ["npm", "start"]
