# Blog API Server

This is a Blog API Server (toy project) that implements the following:
- User Registration, Login and Log-Out
- Categories CRUD
- Blog CRUD

Take note of the following features
- Authentication and Authorization happens with the use of JWT tokens
- A user can have many blog posts
- A category can have many blog posts
- Swagger API-like documentation (in progress)

## Requirements
- macOS
- Home Brew
- Rbenv
- Direnv


## ❗️ Important Links

- 📄 [Docs](https://rubyonrails.org/)

## 💿 Install

Set up your project using your preferred package manager. Use the corresponding command to install the dependencies:

```bash
# This installs the required Ruby version for this project (in .ruby-version file)
rbenv install

# This installs rails
gem install rails

# This installs the dependencies for this project
bundle install
```

Make an environment variable file
```bash
cp .envrc.sample .envrc
```

```bash
# Update the values. For the RAILS_MASTER_KEY
export DB_HOST='127.0.0.1'
export DB_PORT='5432'
export DB_NAME="blog_dev"
export DB_USER="postgres"
export DB_PASSWORD="securepassword"
export RAILS_MASTER_KEY="06cba32d231c5eab9e8d616fab3df0f5"
export DB_TYPE='postgresql'
```


After completing the installation, your environment is ready for Vuetify development.

## ✨ Features

- 🖼️ **Main Screen**: [Home Screen](http://localhost:3000)

As features are added, you will see the above list increase

## 💡 Usage

This section covers how to start the development server and build your project for production.

### Starting the Development Server

To start the development server with hot-reload, run the following command. The server will be accessible at [http://localhost:3000](http://localhost:3000):

```bash
rails server
```

### Building for Production

To build your project for production, use:

```bash
# Build assets
bundle exec bootsnap precompile app/ lib/
bundle exec rails assets:precompile

# Then run
rails server -b 0.0.0.0
```