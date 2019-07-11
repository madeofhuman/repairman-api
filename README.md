[![Build Status](https://travis-ci.org/madeofhuman/repairman-api.svg?branch=master)](https://travis-ci.org/madeofhuman/repairman-api) [![Maintainability](https://api.codeclimate.com/v1/badges/35fc98d9af9789174554/maintainability)](https://codeclimate.com/github/madeofhuman/repairman-api/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/35fc98d9af9789174554/test_coverage)](https://codeclimate.com/github/madeofhuman/repairman-api/test_coverage) 

# README

This is a simple repairman-api:

### Resources
- Users
  - Admin
- Cars
- Quotes
  - Comments

### To test this api
- Clone this repository
- cd into the `repairman-api` folder
- Run the following on the terminal `rails s`
- Hit the following routes:

| Prefix   |      Verb      |  URI Pattern | Controller#Action |
|----------|:-------------:|------:|------:|
| car_quote_comments | GET | /cars/:car_id/quotes/:quote_id/comments(.:format) | comments#index |
| | POST | /cars/:car_id/quotes/:quote_id/comments(.:format) | comments#create |
| car_quote_comment | GET | /cars/:car_id/quotes/:quote_id/comments/:id(.:format) | comments#show |
| | PATCH | /cars/:car_id/quotes/:quote_id/comments/:id(.:format) | comments#update |
| | PUT | /cars/:car_id/quotes/:quote_id/comments/:id(.:format) | comments#update |
| | DELETE | /cars/:car_id/quotes/:quote_id/comments/:id(.:format) | comments#delete |
| car_quotes | GET | /cars/:car_id/quotes(.:format) | quotes#index  |
|  | POST | /cars/:car_id/quotes(.:format) | quotes#create |
| car_quote | GET |    /cars/:car_id/quotes/:id(.:format) | quotes#show |
| | PATCH | /cars/:car_id/quotes/:id(.:format) | quotes#update |
| | PUT | /cars/:car_id/quotes/:id(.:format) | quotes#update |
| | DELETE | /cars/:car_id/quotes/:id(.:format) | quotes#destroy |
| cars | GET | /cars(.:format) | cars#index |
| | POST | /cars(.:format) | cars#create |
| car | GET | /cars/:id(.:format) | cars#show |
| | PATCH | /cars/:id(.:format) | cars#update |
| | PUT | /cars/:id(.:format) | cars#update |
| | DELETE | /cars/:id(.:format) | cars#destroy |
| auth_login | POST | /auth/login(.:format)| authentication#authenticate |
| signup | POST | /signup(.:format) | users#create |
| user_quotes | GET | /users/:id/quotes(.:format) | quotes#user_quotes |
| admin_cars | GET | /admin/cars(.:format) | cars#all_cars |
| admin_quotes | GET | /admin/quotes(.:format) | quotes#all_quotes |
| | GET | /admin/quotes/:id(.:format) | quotes#show_quote |
| | POST | /admin/quotes/:quote_id/comments(.:format) | comments#create |
| | GET | /admin/quotes/:quote_id/comments/:id(.:format) | comments#show_comment |


### Happy hacking :rocket:

Official Jiggy Stamp:
[![Jiggy|Stamp](https://svgshare.com/i/Bfm.svg)](https://github.com/ProfJigsaw)

Official madeofhuman
[![madeofhuman](https://img.shields.io/badge/madeof-human-blueviolet.svg)](https://github.com/madeofhuman)
