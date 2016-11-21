class Workflow < ActiveRecord::Base
	has_many :stepDefinitions, dependent: :destroy
	accepts_nested_attributes_for :stepDefinitions, allow_destroy: true
	self.inheritance_column = nil
end
