class CreateProfiles < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
  		t.integer :user_id
	  	t.text :description
	  	t.string :tagline
	  	t.string :video_url
	  	t.string :photo_url

	  	t.timestamps
	end
  end
end
