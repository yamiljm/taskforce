class User < ActiveRecord::Base
    has_many :tasks

    def authenticate(password)
    	return self.password == password
    end

    def to_s
    	return name
    end
end
