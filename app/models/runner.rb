class Runner < ActiveRecord::Base
	#attr_accessible :full_name, :birthday, :gender, :address, :city_of_birth, :state, :runners_team, :home_number, :mobile_number, :illness_exists, :illness_description

	has_one :user
	has_many :race_runners
  	has_many :race_editions, through: :race_runners
end