class CreateRaceRunners < ActiveRecord::Migration
  def change
    create_table :race_runners do |t|

      t.timestamps null: false
    end
  end
end
