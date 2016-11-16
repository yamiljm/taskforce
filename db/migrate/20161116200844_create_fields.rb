class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :fieldType
      t.string :validationRegex
      t.boolean :required
      t.string :errorMessage
      t.integer :order
      t.references :step, index: true

      t.timestamps
    end
  end
end
