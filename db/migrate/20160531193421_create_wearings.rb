class CreateWearings < ActiveRecord::Migration
  def change
    create_table :wearings do |t|
      t.belongs_to :cohort, index: true, foreign_key: true
      t.belongs_to :shirt, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
