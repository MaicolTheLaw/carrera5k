class RaceEdition < ActiveRecord::Base
	belongs_to :route
	has_many :race_runners
  has_many :runners, through: :race_runners
end