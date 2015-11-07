class RaceRunnersFields < ActiveRecord::Migration
  def change
  	add_column :race_runners, :race_edition_id, :integer
  	add_column :race_runners, :runner_id,       :integer
  	add_column :race_runners, :has_payment,     :boolean
  	add_column :race_runners, :has_kit,         :boolean
  	add_column :race_runners, :runner_number,   :integer
  end
end
