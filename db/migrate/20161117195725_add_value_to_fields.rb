class AddValueToFields < ActiveRecord::Migration
  def change
    add_column :fields, :value, :string
  end
end
