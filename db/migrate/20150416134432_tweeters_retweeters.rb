class TweetersRetweeters < ActiveRecord::Migration
  def change
  	create_table :tweeters_retweeters do |t|
  		t.integer :tweeter_id
  		t.integer :retweeter_id
  		t.integer :tweet_id
  		
  		t.timestamps null: false
  	end
  end
end
