class RunnersController < ApplicationController
	before_filter :authenticate_user!


	def show 
		@run = Runner.where(user_id:  current_user.id).take
		@runner = Runner.find(@run[:id])
	end	

	def new
		@runner = Runner.new
	end	

	def create
		@runner = Runner.new(runner_params)
		@runner.user_id = current_user.id
		@runner.save
		redirect_to root_path
	end	

	def edit
		@run = Runner.where(user_id:  current_user.id).take
		@runner = Runner.find(@run[:id])
	end	
	

	def update
		@runner.update_attributes(runner_params)	
	end	

	private

  	def runner_params
    	params.require(:runner).permit(:full_name, :birthday, :gender, :address, :city_of_birth, :state, :runners_team, :home_number, :mobile_number, :illness_exists, :illness_description)
  	end
end
