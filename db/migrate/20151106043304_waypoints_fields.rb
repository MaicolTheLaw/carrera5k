class WaypointsFields < ActiveRecord::Migration
  def change
  	add_column :waypoints, :location, :string
  	add_column :waypoints, :route_id, :integer
  end
end
