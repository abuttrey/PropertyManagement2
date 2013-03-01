class JoinTable < ActiveRecord::Migration
  def change
    create_table :leases_users, :id => false do |t|
      t.references :lease
      t.references :user
    end
  end
end
