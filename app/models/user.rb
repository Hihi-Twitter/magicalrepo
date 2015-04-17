class User < ActiveRecord::Base
    include Gravtastic
    has_secure_password
    validates_uniqueness_of :email, :handle
    validates_presence_of :email, :handle, :name
    has_many :followee_follows, class_name: 'Follow', foreign_key: 'followee_id'
    has_many :followers, class_name: 'User', through: :followee_follows

    has_many :follower_follows, class_name: 'Follow', foreign_key: 'follower_id'
    has_many :followees, class_name: 'User', through: :follower_follows
    has_many :tweets
    gravtastic :email
end
