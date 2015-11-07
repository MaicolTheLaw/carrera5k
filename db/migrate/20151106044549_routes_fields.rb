class RoutesFields < ActiveRecord::Migration
  def change
  	add_column :routes, :name, :string
  	add_column :routes, :start_point, :string
  	add_column :routes, :finish_point, :string
  end
end
