class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :email, null: false
  		t.string :username, null: false
  		t.string :password, :limit => 50, null: false
  		t.integer :profile_id

  		t.timestamps 
  	end
  end
end
