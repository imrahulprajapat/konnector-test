# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	ruby "3.0.0"

* System dependencies
	- intall ruby, rails , msql
	- To install please visit https://gorails.com/setup/ubuntu/20.04

* Configuration
	After installing all dependacies clone this respogitory
	Go to config/database.yml and change msql username and password with yours

	Run bundle install

* Database creation
	
	rails db:create

* Database initialization

	rails db:migrate

* How to run the test suite
	
	Im assuming your application is working 3000 port if not then change the base_url

	To get all the users records

	curl --location 'http://localhost:3000/users' \
--header 'Content-Type: application/json'
	
	To Create new user record

	curl --location --request GET 'http://localhost:3000/users/filter?campaign_names=cam1%2Ccam2' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "Rahul Prjapat",
  "email": "rahul.prajapat7921@gmail.com",
  "campaigns_list": [
        {
            "campaign_name": "test4",
            "campaign_id": "3"
        },
        {
            "campaign_id": "4",
            "campaign_name": "test5"
        }
    ]
}

	To get filtered users based on cmapaign_name

	curl --location 'http://localhost:3000/users/filter?campaign_names=cam1%2Ccam2'

	If this curl is not working then simply use postman and call this endpoints as you have mentioned in assesment.

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
