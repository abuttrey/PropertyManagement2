class RemoveFkFromUser < ActiveRecord::Migration
   def change
    remove_column :users, :lease_id
  end
end
