# Используем официальный образ Node.js
FROM node

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

# Используем официальный образ Jenkins в Docker Hub
FROM jenkins/jenkins:lts

# Устанавливаем плагины Jenkins
RUN /usr/local/bin/install-plugins.sh \
    git \
    workflow-aggregator \
    docker-workflow \
    blueocean \
    credentials-binding

# Устанавливаем Docker
USER root
RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -y install docker-ce && \
    usermod -aG docker jenkins
USER jenkins