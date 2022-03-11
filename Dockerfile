FROM node:latest
WORKDIR /app
COPY . .
RUN npm i
ENTRYPOINT ["npm", "start"]
ENV PORT=4000
