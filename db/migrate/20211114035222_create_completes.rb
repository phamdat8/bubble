class CreateCompletes < ActiveRecord::Migration[6.1]
  def change
    create_table :completes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
