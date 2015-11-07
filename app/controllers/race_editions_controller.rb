class RaceEditionsController < ApplicationController

	def index
		@race_editions = Race_editions.all
	end	

	def new
		@race_editions = Race_editions.new()
	end	

	def create
		@race_editions = Race_editions.new(race_editions_params)
		@race_editions.save
		redirect_to root_path
	end	

	private

  	def race_editions_params
    	params.require(:race_editions).permit(:race_name, :no_kilometers, :race_date, :race_address, :route_id, :no_of_running_kits)
  	end
end
