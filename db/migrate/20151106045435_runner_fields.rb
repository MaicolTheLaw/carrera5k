class RunnerFields < ActiveRecord::Migration
  def change
  	add_column :runners, :full_name, :string
  	add_column :runners, :birthday, :date
  	add_column :runners, :gender, :string
  	add_column :runners, :address, :string
  	add_column :runners, :city_of_birth, :string
  	add_column :runners, :state, :string
  	add_column :runners, :runners_team, :string
  	add_column :runners, :home_number, :string
  	add_column :runners, :mobile_number, :string
  	add_column :runners, :illness_exists, :string
  	add_column :runners, :illness_description, :string
  	add_column :runners, :user_id, :integer
  end
end
