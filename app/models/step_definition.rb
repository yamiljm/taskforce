class StepDefinition < ActiveRecord::Base
    belongs_to :taskDefinitions
    has_many :fieldDefinitions, dependent: :destroy
    accepts_nested_attributes_for :fieldDefinitions, allow_destroy: true

    def self.createStepDefinitions(step_definitions_attributes) 
	    stepDefinitons = []
	    step_definitions_attributes.each { |step_definition_attributes| 
	      fields_definitions_attributes = step_definition_attributes.delete("fieldDefinitions")
	      stepDefinition = StepDefinition.new(step_definition_attributes)
	      stepDefinition.fields = Field.createFields(fields_definitions_attributes)
	      stepDefinitons.push(stepDefinition)
	    }
	    stepDefinitons
    end

  def self.updateSteps(step_definitions_attributes)
  	step_definitions_attributes.each { |step_definition_attribute| 
  		field_definitions_attributes = step_attribute.delete("fieldDefinitions")
  		Field.updateFields(field_definitions_attributes)
  		stepDefinition = Step.find(step_definition_attribute[:id])
  		stepDefinition.update(step_definition_attribute)
  	}
  end

end
