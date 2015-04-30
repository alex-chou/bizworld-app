Bizworld: Assessment Platform
===
Bizworld First Interview Video: http://youtu.be/86k3TqS-VzA

## To setup rails app
  Run ```cd . && bin/setup``` from project root to set things up.

### Install gems in Gemfile
`$ bundle install --without production`
### Run database migrations
`$ bundle exec rake db:migrate`
### Rollback database migration
`$ bundle exec rake db:rollback [STEP=#]`
### Run specific up / down for migration
```
$ db:migrate:up VERSION=my_version
$ db:migrate:down VERSION=my_version
```
### Setup Cucumber
`rails generate cucumber:install`
### Setup RSpec
`rails generate rspec:install`
### Create DB Migration
`rails generate migration`
