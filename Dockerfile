FROM node

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . ./

#ENV NODE_ENV "production"

#ENTRYPOINT ["/usr/src/app/node_modules/.bin/sequelize db:migrate" ]

#ENTRYPOINT /usr/src/app/node_modules/.bin/sequelize db:migrate

# Run the web service on container startup.
CMD [ "npm", "start" ]