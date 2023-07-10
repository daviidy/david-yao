FROM ruby:2.7.2

# Set the working directory in the container
WORKDIR /app

RUN apt-get update && apt-get install -y curl gnupg2 && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

COPY package.json yarn.lock ./
RUN yarn install --check-files

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application to the container
COPY . .

# Set up environment variables
ENV DATABASE_URL=postgresql://postgres:password@db:5432/app_development

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
