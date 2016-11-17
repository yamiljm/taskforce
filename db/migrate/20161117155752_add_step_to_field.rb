class AddStepToField < ActiveRecord::Migration
  def change
    add_column :fields, :step, :reference
  end
end
