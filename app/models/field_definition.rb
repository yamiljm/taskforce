class FieldDefinition < ActiveRecord::Base
	belongs_to :stepDefinitions

	def self.createFieldDefinitions(field_definitions_attributes) 
		if (field_definitions_attributes)
  			field_definitions_attributes.map{ |field_definition_attribute| FieldDefinition.new(field_definition_attribute) }
  		end
  	end

	def self.updateFieldDefinitions(field_definitions_attributes)
		if (field_definitions_attributes)
		  	field_definitions_attributes.map{|f| 
		      fieldDefinition = FieldDefinition.find(f[:id])
		      fieldDefinition.update(f)
		    }
		end
	end

end
