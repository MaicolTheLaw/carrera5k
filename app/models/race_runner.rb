class RaceRunner < ActiveRecord::Base
	belongs_to :runner 
	belongs_to :race_edition
end
