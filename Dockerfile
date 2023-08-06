FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

# Используем официальный образ Node.js в качестве базового образа
FROM node:14-alpine

# Устанавливаем Docker внутри контейнера
RUN apk update && apk add docker

# Устанавливаем npm внутри контейнера
RUN apk add npm

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем package.json и package-lock.json в рабочую директорию
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем все файлы проекта в рабочую директорию
COPY . .

# Собираем приложение
RUN npm run build

# Указываем порт, который будет прослушивать контейнер
EXPOSE 5172

# Запускаем приложение при старте контейнера
CMD ["npm", "start", "--", "--port", "5172"]
