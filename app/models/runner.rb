class Runner < ActiveRecord::Base
	has_one :user
	has_many :race_runners
  has_many :race_editions, through: :race_runners
end