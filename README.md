# ForumRuby (Created by Tomas Stanislovėnas PI18B)

A simple Forum website written using Ruby on Rails

## About
* Forum allows user to login and register to database, create discussions topics and reply to them.
* Discussions and replies fully implement CRUD functions.
* Open Demonstration.pdf to see website in action.

## Tools used
* Project created in Ruby 2.5.5 and in Rails 5.2.1 version.
* For testing, XAMPP 8.0.0 MySQL database was used.
* Website uses Bulma Framework for CSS
* Project uses Devside for login and registration.

## Database Creation
* Write your database info inside config/database.yml.
* Type `rails db:create` inside terminal to create database.
* Type `rails db:migrate` to fill database with predefined tables.

## How to start
* Type `bundle install`
* Server initializes with `rails server` command when typed inside terminal
* Server should start at localhost:3000.
* Press Ctrl+C to stop the server

## Roles (has 3 roles)
* Unregsitered - can view discussion, but can't participate.
* Registered - can create topics, write replies and edit their created content.
* Admin - same as registered, but can also edit and delete all content no matter who's it is.
