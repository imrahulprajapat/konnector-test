# README



https://github.com/imrahulprajapat/konnector-test/assets/28958100/eb17d2c5-15fc-4acf-970f-eb6ff8ce6f9a



Things you may want to cover:

* Ruby version
	- ruby "3.0.0"

* System dependencies
	- install ruby, rails , msql
	- To install please visit https://gorails.com/setup/ubuntu/20.04

* Configuration
	- After installing all dependacies clone this respogitory
	- Go to `config/database.yml` and change msql username and password with yours
	- Run `bundle install`

* Database creation
	
	- create database `rails db:create`

* Database initialization

	- migrate database `rails db:migrate`

* How to run the test suite
	
	Im assuming your application is working `3000` port if not then change the `base_url`

	- To get all the users records

		```
  		curl --location 'http://localhost:3000/users' \ --header 'Content-Type: application/json'
  		```
	
	- To Create new user record
		

		```
  			curl --location 'http://localhost:3000/users' \
			--header 'Content-Type: application/json' \
			--data-raw '{
			  "name": "Alice",
			  "email": "alice1@gmail.com",
			  "campaigns_list": [
			      {"campaign_name": "cam4", "campaign_id": "id4"},
			      {"campaign_name": "cam3", "campaign_id": "id3"}
			    ]
			}'
  		```

	- To get filtered users based on cmapaign_name

	```
		curl --location 'http://localhost:3000/users/filter?campaign_names=cam1%2Ccam2'
 	```

  ##### If this curl is not working then simply use postman and call this endpoints as you have mentioned in assesment.

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
