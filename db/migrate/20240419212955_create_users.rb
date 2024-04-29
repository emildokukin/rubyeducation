class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, force: :cascade do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
