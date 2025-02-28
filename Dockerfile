# Utiliser Node.js comme base
FROM node:18

# Définir le dossier de travail
WORKDIR /app

# Copier uniquement les fichiers nécessaires pour installer les dépendances
COPY package.json package-lock.json ./

# Installer Expo CLI et Ngrok
RUN npm install -g expo-cli @expo/ngrok && npm install

# Copier tout le projet
COPY . .

# Exposer les ports nécessaires à Expo
EXPOSE 8081 19000 19001 19002

# Lancer Expo avec le tunnel activé
CMD ["npx", "expo", "start", "--tunnel"]
