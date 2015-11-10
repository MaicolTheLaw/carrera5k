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

end
