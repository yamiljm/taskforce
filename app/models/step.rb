class Step < ActiveRecord::Base

  belongs_to :task
  has_many :fields#, inverse_of: :step
  accepts_nested_attributes_for :fields


  def createSteps(steps_attributes) 
    steps = []
    steps_attributes.each { |step_attribute| 
      fields_attributes = step_attribute.delete("fields")
      step = Step.new(step_attribute)
      step.fields = fields_attributes.map{ |field_attribute| 
        Field.new(field_attribute)
      }
      steps.push(step)
    }
  end

  

end
