class EraseMains < ActiveRecord::Migration
  def change
  	drop_table :mains
  end
end
