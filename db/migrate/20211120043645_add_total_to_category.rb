class AddTotalToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :total, :integer, default: 0
    add_column :categories, :process, :integer, default: 0
  end
end
