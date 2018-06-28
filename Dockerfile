FROM node:8.6.0-alpine

COPY . /app
WORKDIR /app

RUN npm install && \
    npm run build && \
    # npm prune --production is broken on npm 5.3.0
    # See https://github.com/npm/npm/issues/17781
    rm -rf node_modules/ && \
    npm install --production

RUN chmod -R 777 /app

EXPOSE 8080

ENTRYPOINT ["./docker/entrypoint.sh"]
