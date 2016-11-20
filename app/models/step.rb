class Step < ActiveRecord::Base

  belongs_to :task
  has_many :fields#, inverse_of: :step
  accepts_nested_attributes_for :fields


  def self.createSteps(steps_attributes) 
    steps = []
    steps_attributes.each { |step_attribute| 
      fields_attributes = step_attribute.delete("fields")
      step = Step.new(step_attribute)
      step.fields = Field.createFields(fields_attributes)
      steps.push(step)
    }
    steps
  end

  def self.updateSteps(steps_attributes)
  	steps_attributes.each { |step_attribute| 
  		fields_attributes = step_attribute.delete("fields")
  		Field.updateFields(fields_attributes)
  		step = Step.find(step_attribute[:id])
  		step.update(step_attribute)
  	}
  end

end
