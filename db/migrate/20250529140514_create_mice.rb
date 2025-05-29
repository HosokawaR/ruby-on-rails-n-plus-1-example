class CreateMice < ActiveRecord::Migration[8.0]
  def change
    create_table :mice do |t|
      t.string :name

      t.timestamps
    end
  end
end
