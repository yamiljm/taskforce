class Step < ActiveRecord::Base
  belongs_to :task
  has_many :field
  #accepts_nested_attributes_for :field
end
