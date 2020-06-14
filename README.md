# Animal Shelter API

#### By Austin Butler

## Description

_An API for adoptable dogs and cats from a local shelter_


## Setup/Installation Requirements to run locally:

* _Step 1: Clone this repository https://github.com/austinb847/animal_shelter_api_
* _Step 2: Cd to new directory_
* _Step 3: Run Bundle install_
* _Step 4: Run rake db:setup to setup database with seeded data_
* _Step 4: Run rails s_
* _Step 5: Navigate to localhost:3000 to make requests_


## Endpoints

| HTTP Verb | URL                                                                    | Description                  | Query Parameters          |
|-----------|------------------------------------------------------------------------|------------------------------|---------------------------|
| GET       | http://localhost:3000/animals                                          | Get list of all animals      | None                      |
| GET       | http://localhost:3000/animals/id                                       | Get a single animal by id    | None                      |
| POST      | http://localhost:3000/animals                                          | Create new animals           | None                      |
| PUT       | http://localhost:3000/animals/id                                       | Update a single animal by id | None                      |
| DELETE    | http://localhost:3000/animals/id                                       | Delete a single animal by id | None                      |
| GET       | http://localhost:3000/random                                           | Get a single random animal   | None                      |
| GET       | http://localhost:3000/search/?gender=male&?species=dog&?breed=labrador | Get animals by searching     | gender, species, or breed |


## Rate Limiting:

* Rack-attack gem used to limit requests. By default it is configured for 100 requests per 2 minutes. To change limit and period navigate to config/initializers/rack_attack.rb 


## Technologies Used

* Ruby/Rails

Copyright (c) 2020 **_Austin Butler_**
