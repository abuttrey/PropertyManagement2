class CreatePaymentTable < ActiveRecord::Migration
   def change
    create_table :payment_transactions do |t|
      t.string :response
      t.integer :payment_id
      

      t.timestamps
    end
   end
end
