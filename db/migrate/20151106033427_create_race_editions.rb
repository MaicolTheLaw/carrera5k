class CreateRaceEditions < ActiveRecord::Migration
  def change
    create_table :race_editions do |t|

      t.timestamps null: false
    end
  end
end
