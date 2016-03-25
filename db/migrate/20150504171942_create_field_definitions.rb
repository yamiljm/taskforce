class CreateFieldDefinitions < ActiveRecord::Migration
  def change
    create_table :field_definitions do |t|
      t.string :name
      t.string :type
      t.string :validationRegex
      t.boolean :required
      t.integer :step_definition_id
      t.string :errorMessage
      t.integer :order

      t.timestamps
    end
  end
end
