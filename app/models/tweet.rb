class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :content
end
