FROM node:alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
# Expose doesnt do nothing locally but on beanstalk it exposes the port
