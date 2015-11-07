class Route < ActiveRecord::Base
	has_many :waypoints 
	has_many :race_editions
end