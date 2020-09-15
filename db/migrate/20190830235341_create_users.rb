class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.text :password_digest
      t.text :image
      t.text :uid
      t.boolean "admin", default: false

      t.timestamps
    end
  end
end
