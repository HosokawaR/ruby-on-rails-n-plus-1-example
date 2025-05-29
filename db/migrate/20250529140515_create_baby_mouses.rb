class CreateBabyMouses < ActiveRecord::Migration[8.0]
  def change
    create_table :baby_mouses do |t|
      t.string :name
      t.references :mouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
