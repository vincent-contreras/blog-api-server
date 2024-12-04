# syntax=docker/dockerfile:1

# Base image with Ruby
ARG RUBY_VERSION=3.3.5
FROM ruby:$RUBY_VERSION-slim AS base

# Set working directory
WORKDIR /rails

# Install base dependencies common to all environments
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libjemalloc2 \
    libvips && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set build-time argument for environment (default: development)
ARG RAILS_ENV=development
ENV RAILS_ENV=$RAILS_ENV

# Install dependencies needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    default-libmysqlclient-dev \
    git \
    pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --without production development test || \
    bundle install --without production || \
    bundle install --without test

# Install additional tools for development
RUN if [ "$RAILS_ENV" = "development" ]; then \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    inotify-tools \
    nodejs \
    yarn && \
    yarn install --check-files && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives; \
fi

# Copy application code
COPY . .

# Precompile assets and prepare production-only optimizations
RUN if [ "$RAILS_ENV" = "production" ]; then \
    bundle exec bootsnap precompile app/ lib/ && \
    bundle exec rails assets:precompile; \
fi

# Expose ports (3000 for development, 80 for production)
EXPOSE ${PORT:-3000}

# Entry point for all environments
ENTRYPOINT ["bin/docker-entrypoint"]

# Default command for development or production
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
