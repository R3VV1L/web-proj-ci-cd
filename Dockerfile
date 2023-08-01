# Используем официальный образ Node.js
FROM node:14-alpine

# Устанавливаем зависимости
WORKDIR /app
COPY package*.json ./
RUN npm install

# Копируем исходный код
COPY . .

# Собираем приложение
RUN npm run build

# Запускаем приложение на порту 5172
EXPOSE 5172
CMD ["npm", "start"]