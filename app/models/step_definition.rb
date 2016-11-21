class StepDefinition < ActiveRecord::Base
    belongs_to :taskDefinitions
    has_many :field_definitions, class_name: "FieldDefinition", dependent: :destroy
    accepts_nested_attributes_for :field_definitions, allow_destroy: true
    self.inheritance_column = nil

    def self.createStepDefinitions(step_definitions_attributes) 
	    stepDefinitons = []
      if (step_definitions_attributes) 
  	    step_definitions_attributes.each { |step_definition_attributes| 
  	      fields_definitions_attributes = step_definition_attributes.delete("field_definitions")
          if (fields_definitions_attributes)
    	      stepDefinition = StepDefinition.new(step_definition_attributes)
    	      stepDefinition.field_definitions = FieldDefinition.createFieldDefinitions(fields_definitions_attributes)
    	      stepDefinitons.push(stepDefinition)
          end 
  	    }
      end 
	    stepDefinitons
    end

  def self.updateStepDefinitions(step_definitions_attributes)
    if step_definitions_attributes
    	step_definitions_attributes.each { |step_definition_attribute| 
    		field_definitions_attributes = step_definition_attribute.delete("field_definitions")
        if (fields_definitions_attributes)
      		FieldDefinition.updateFieldDefinitions(field_definitions_attributes)
      		stepDefinition = StepDefinition.find(step_definition_attribute[:id])
      		stepDefinition.update(step_definition_attribute)
        end
    	}
    end
  end

  def transformToStep
    step = Step.new
    step.order = self.order

    if self.field_definitions
      step.fields = []
      self.field_definitions.each do |fieldDefinition|
        step.fields.push(fieldDefinition.transformToField)
      end
    end

    return step
  end

end
