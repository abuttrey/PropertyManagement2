class AddFkLease < ActiveRecord::Migration
  def change
    add_column :leases, :unit_id, :integer
  end
end
