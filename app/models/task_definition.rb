class TaskDefinition < ActiveRecord::Base
	has_many :stepDefinitions
end
