class AddFkUnit < ActiveRecord::Migration
  def change
    add_column :units, :property_id, :integer
  end
end
