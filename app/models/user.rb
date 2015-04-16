class User < ActiveRecord::Base
    has_secure_password
    validates_uniqueness_of :email, :handle
    validates_presence_of :email, :handle, :name

end
