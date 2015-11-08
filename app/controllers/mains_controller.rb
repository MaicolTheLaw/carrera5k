class MainsController < ApplicationController
	
	def index
	end

	def about 
	end

	def historia
		@race_editions = RaceEdition.all
	end

end
