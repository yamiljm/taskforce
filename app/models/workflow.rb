class Workflow < ActiveRecord::Base
	# attr_accessible :step_definitions
	has_many :step_definitions, dependent: :destroy
	accepts_nested_attributes_for :step_definitions, allow_destroy: true
	self.inheritance_column = nil
end
