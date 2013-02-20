class CreateRepairRequests < ActiveRecord::Migration
  def change
    create_table :repair_requests do |t|
      t.date :open_date
      t.date :close_date
      t.text :request_details
      t.text :request_response

      t.timestamps
    end
  end
end
