class AddOptionsToFieldDefinitions < ActiveRecord::Migration
  def change
    add_column :field_definitions, :options, :string
  end
end
