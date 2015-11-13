class MainsController < ApplicationController
	
	def index
		if user_signed_in?
			datos = Runner.where(user_id:  current_user.id).take
			if current_user.user_type == 1 && datos == nil
				redirect_to :controller=>"runners", :action=> "new" , :id => current_user.id
			end
		end		
	end

	def about 
	end

	def historia
		@race_editions = RaceEdition.all
	end

	def payment
		@usuario = Hash.new
		@usuario = Runner.where(user_id: current_user.id).last
		@runner_number = RaceRunner.where(race_edition_id: RaceEdition.last.id).count + 1
		rid = Runner.where(user_id: current_user.id).last
		@runner_id = rid.id
		race_e = RaceEdition.order(created_at: :desc).last
		@race_edition_id = race_e.id
		@race_name = race_e.race_name
		@race_date = race_e.race_date
		@race_address = race_e.race_address
		@has_payment = true
		@price = 100
		if RaceRunner.where(has_kit: true).count > 500
		@has_kit = false
		else
		@has_kit = true
		end	

		user = User.find(current_user.id)
		@user = user.email
		UserMailer.breakfast_report(@user).deliver_now


	end	

end
