class RaceEditionsFields < ActiveRecord::Migration
  def change
  	add_column :race_editions, :race_name,          :string
  	add_column :race_editions, :race_date,          :date
  	add_column :race_editions, :no_kilometers,      :decimal
  	add_column :race_editions, :race_address,       :string
  	add_column :race_editions, :no_of_running_kits, :integer
  	add_column :race_editions, :route_id,           :integer
  end
end
