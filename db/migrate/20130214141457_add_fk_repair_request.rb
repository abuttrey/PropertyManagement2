class AddFkRepairRequest < ActiveRecord::Migration
  def change
    add_column :repair_requests, :submitter_id, :integer
    add_column :repair_requests, :responder_id, :integer
  end
end
