class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.text :content
  		t.string :tweets_image
  		t.integer :count_retweet
  		t.integer :user_id
  		t.belongs_to :user, index: true
  		t.timestamps null: false
  	end
  end
end
