class RaceEditionsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_admin_user, except:[:index]

	def index
		@race_editions = RaceEdition.all
	end	

	def new
		@race_editions = RaceEdition.new
	end	

	def create
		@race_editions = RaceEdition.new(race_editions_params)
		@race_editions.save
		redirect_to root_path
	end	
	
	def edit
		@race_editions = RaceEdition.find(params[:id])
	end	
	
	def update
		@race_editions = RaceEdition.find(params[:id])
		@race_editions.update_attributes(race_editions_params)	
		redirect_to race_editions_path
	end	

	def destroy
		@race_editions = RaceEdition.find(params[:id])
		@race_editions.destroy
		redirect_to race_editions_path
	end

	private
  	def race_editions_params
    	params.require(:race_editions).permit(:race_name, :no_kilometers, :race_date, :race_address, :route_id, :no_of_running_kits)
  	end

  	def check_admin_user
  		if current_user.user_type != "96"
  			redirect_to root_path
  		end	
  	end	
end
