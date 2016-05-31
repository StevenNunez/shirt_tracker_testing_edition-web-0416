class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :notes
      t.belongs_to :cohort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
