class User < ActiveRecord::Base
    has_many :tasks

    def authenticate(password)
    	return true
    end
end
