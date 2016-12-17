class User < ActiveRecord::Base
    has_many :tasks

    def authenticate(password)
    	return true
    end

    def to_s
    	return name
    end
end
