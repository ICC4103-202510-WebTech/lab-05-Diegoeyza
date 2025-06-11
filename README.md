# Instructions
## Login credentials
You can login as admin with the credentials admin@admin.com and password 123456
only the admin can see all of the users, the users dont have access to this tab

You can login as a regular user with chats using the credentials Minion_101@miuandes.cl and password 123456



# Step-by-Step Guide to Create a Rails App

## Prerequisites
Make sure you have the necessary dependencies installed before starting.

### Install Ruby and Rails
```sh
rbenv install 3.3.6
rbenv shell 3.3.6
gem install rails
gem install bundler
rbenv rehash
```

### Install PostgreSQL dependencies
```sh
sudo apt update
sudo apt install libpq-dev
gem install pg
```

### Set Up PostgreSQL User
Replace `#HomeDirUsername` with your actual home directory username.
```sh
sudo -u postgres createuser -s #HomeDirUsername
```

## Create a New Rails Application
Replace `#AppName` with your desired application name.
```sh
rails new #AppName --database=postgresql -j esbuild --css bootstrap
cd #AppName
rails db:create
rails server
```

## Fixing `application.js` Issues
If you encounter issues with the app finding `application.js`, follow these steps:

```sh
npm install @hotwired/turbo-rails bootstrap @hotwired/stimulus
rm -rf node_modules package-lock.json
npm install
npm run build
rails assets:clobber
rails assets:precompile
bin/dev
```

Your Rails app should now be running successfully!
