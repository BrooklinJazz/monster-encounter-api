# README

This Api is responsible for handling the requests from monster-encounter-client. For more information go to https://github.com/BrooklinJazz/monster-encounter-client

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

## Additional Project Gems:
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
### 1. Combats
#### index
retrieve all the combats that belong to a given user and returns the data as json. these can be found in the Save File section of the client.
#### create
saves a new combat
#### show
sends back the json for a combat of given id. used for retrieving saved combats
### 2. Monsters
#### index
returns JSON for the monsters from the Monster Manual
### 3. Players
#### index
retrieve all the players that belong to a given user and returns the data as json. these can be found in the Player Library of the client.
### 4. Users
#### CRUD
### 5. Tokens
#### create
creates a new jwt token for a given user.
