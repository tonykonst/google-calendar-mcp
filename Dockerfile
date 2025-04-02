FROM node:18-alpine

WORKDIR /app

# ❗ Сразу копируем весь проект, включая src/
COPY . .

# Теперь можно безопасно устанавливать зависимости с postinstall
RUN npm install

# Собираем, если нужно
RUN npm run build

EXPOSE 8080
CMD ["npm", "start"]
