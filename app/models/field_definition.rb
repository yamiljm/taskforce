class FieldDefinition < ActiveRecord::Base
	belongs_to :stepDefinitions
	self.inheritance_column = nil

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

	def transformToField

		field = Field.new
		field.name = self.name
		field.fieldType = self.field_type
		field.validationRegex = self.validationRegex
		field.required = self.required
		field.errorMessage = self.errorMessage
		field.order = self.order
		field.options = self.options

		return field
	end

end
