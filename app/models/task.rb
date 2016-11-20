class Task < ActiveRecord::Base
    has_many :steps, dependent: :destroy
    belongs_to :user
    accepts_nested_attributes_for :steps, allow_destroy: true
end
