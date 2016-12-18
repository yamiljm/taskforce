class AddOptionsToFields < ActiveRecord::Migration
  def change
    add_column :fields, :options, :string
  end
end
