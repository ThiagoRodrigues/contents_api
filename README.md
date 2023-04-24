# README

This README provides requirements and information on how to get the application up and running.

## Ruby version
- 3.1.2

## System dependencies

Please make sure you have the following system dependencies installed:

- Ruby 3.1.2
- Rails 7.0.0
- PostgreSQL
## Configuration

To configure the application, follow these steps:

1. Clone the repository to your local machine.
2. Navigate to the application's root directory.
3. Run `bundle install` to install all the necessary gems.
4. Run `rails db:create` to create the database.
5. Run `rails db:migrate` to run the database migrations.
5. Run `rails db:seed` to seed the database with the default data in aleatory order.
6. Run `rails s` to start the server.

## How to run the test suite

To run the test suite, follow these steps:

1. Navigate to the application's root directory.
2. Run `bundle exec rspec` to run the test suite.


## Endpoints

### GET /api/v1/contents

Returns all contents in the database.
It accepts the following parameters:

| Content Type | Page | Per Page |
|-------------|------|----------|
| [nil, "", 'movie', 'tv_show'] | [integer]    | [integer]|

### GET /
Simply returns http status 200 for health check.
