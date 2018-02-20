# README

This Api is responsible for handling the requests from battle-master-client.

## Setup:
```
Run the following commands in the project directory:

$ bundle
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails s

Open on localhost:3000

go to https://github.com/BrooklinJazz/battle-master-client and follow the instructions for installing the client.
```

## Project Gems:
```rb
gem 'bcrypt', '~> 3.1.7'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'cowsay'
gem 'pry' # added in class
gem 'pry-doc'# added in class then run bundle
gem 'pry-rails' # replace irb in
gem 'hirb'
gem 'jwt'
gem 'rack-cors'
gem 'active_model_serializers'
```
# Project Structure
## Database Relationships
### Users
- has many combats
- has many players

### Combats
- belong to users

### Players
- belong to users

## Controllers
### Combats
#### index
gets all the combats that belong to a given user and returns the data as json
#### create
saves a new combat
