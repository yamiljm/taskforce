class StepDefinition < ActiveRecord::Base
    has_many :fieldDefinitions
    belongs_to :taskDefinitions
    accepts_nested_attributes_for :stepDefinitions
end
