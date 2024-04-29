class CreateValues < ActiveRecord::Migration[7.1]
  def change
    create_table :values, force: :cascade do |t|
      t.integer :user_id
      t.integer :image_id
      t.string :value
      t.string :integer

      t.timestamps
    end
  end
end
