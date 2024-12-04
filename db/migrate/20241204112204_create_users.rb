class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false

      t.timestamps
    end
  end
end
