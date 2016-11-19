class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :order
      t.references :task, index: true

      t.timestamps
    end
  end
end

