class Task < ActiveRecord::Base
    has_many :steps
    belongs_to :user
    accepts_nested_attributes_for :steps
end
