class Step < ActiveRecord::Base

  belongs_to :task
  has_many :fields#, inverse_of: :step
  accepts_nested_attributes_for :fields
end
