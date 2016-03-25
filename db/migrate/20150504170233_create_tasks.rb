class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :type
      t.string :description
      t.string :status
      t.integer :currentStep

      t.timestamps
    end
  end
end
