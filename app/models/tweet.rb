class Tweet < ActiveRecord::Base
	belongs_to :user
	# validates :content, length: { maximum: 140 }
	before_create :content, length: { maximum: 10 }
	
end
