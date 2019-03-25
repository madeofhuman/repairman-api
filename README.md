[![Build Status](https://travis-ci.org/ProfJigsaw/repairman-api.svg?branch=master)](https://travis-ci.org/ProfJigsaw/repairman-api) [![Maintainability](https://api.codeclimate.com/v1/badges/064071b18f5f78759a07/maintainability)](https://codeclimate.com/github/ProfJigsaw/repairman-api/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/064071b18f5f78759a07/test_coverage)](https://codeclimate.com/github/ProfJigsaw/repairman-api/test_coverage) 

# README

This is a simple repairman-api:

### Resources
- Users
- Cars
- Quotes

### To test this api
- Clone this repository
- cd into the `repairman-api` folder
- Run the following on the terminal `rails s`
- Hit the following routes:

| Prefix   |      Verb      |  URI Pattern | Controller#Action |
|----------|:-------------:|------:|------:|
| car_quotes |  GET | /cars/:car_id/quotes(.:format) | quotes#index  |
|  |    POST   |   /cars/:car_id/quotes(.:format) | quotes#create |
| car_quote | GET |    /cars/:car_id/quotes/:id(.:format) | quotes#show |
||PATCH|/cars/:car_id/quotes/:id(.:format)| quotes#update |
||PUT|/cars/:car_id/quotes/:id(.:format)| quotes#update |
||DELETE|/cars/:car_id/quotes/:id(.:format)| quotes#destroy |
|cars|GET|/cars(.:format)|cars#index|
||POST|/cars(.:format)|cars#create|
|car |GET| /cars/:id(.:format) |cars#show|
||PATCH| /cars/:id(.:format) |cars#update |
||PUT| /cars/:id(.:format) |cars#update |
|| DELETE | /cars/:id(.:format) | cars#destroy|
|auth_login | POST | /auth/login(.:format)| authentication#authenticate|
|signup| POST| /signup(.:format)| users#create|


### Happy hacking :rockets:

Official Jiggy Stamp:
[![Jiggy|Stamp](https://svgshare.com/i/Bfm.svg)](https://github.com/ProfJigsaw)
