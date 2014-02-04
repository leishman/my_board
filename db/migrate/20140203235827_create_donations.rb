class CreateDonations < ActiveRecord::Migration
  def change
  	create_table :donations do |t|
  		t.integer :amount
  		t.integer :user_id, null: false
  		t.integer :donor_id

  		t.timestamps
  	end
  end
end
