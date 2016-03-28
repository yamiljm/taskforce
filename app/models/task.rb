class Task < ActiveRecord::Base
    has_many :stepDefinitions
    belongs_to :user
end
