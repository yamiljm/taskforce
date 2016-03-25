class FixFieldDefinitionColumnName < ActiveRecord::Migration
  def change
    rename_column :field_definitions, :type, :field_type
  end
end
