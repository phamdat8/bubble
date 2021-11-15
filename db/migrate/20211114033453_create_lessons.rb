class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.text :name
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
