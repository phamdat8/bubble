class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    change_table :questions do |t|
      t.rename :content, :name
    end
    change_table :answers do |t|
      t.rename :content, :name
    end
  end
end
