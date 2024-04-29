class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images, force: :cascade do |t|
      t.string :name
      t.string :file
      t.string :ave_value
      t.string :float
      t.integer :theme_id

      t.timestamps
    end
  end
end
