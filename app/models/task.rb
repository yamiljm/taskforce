class Task < ActiveRecord::Base
    
    has_many :stepDefinitions
end
