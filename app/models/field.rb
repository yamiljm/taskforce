class Field < ActiveRecord::Base
  belongs_to :step


  def self.createFields(fields_attributes) 
  	fields_attributes.map{ |field_attribute| Field.new(field_attribute) }
  end

  def self.updateFields(fields_attributes)
  	fields_attributes.map{|f| 
      field = Field.find(f[:id])
      field.update(f)
    }
  end

end
