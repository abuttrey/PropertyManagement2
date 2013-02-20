class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.integer :sq_ft
      
      t.timestamps
    end
  end
end
