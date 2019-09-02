class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.belongs_to :user 
      t.binary :photo
      t.string :contact_type
      t.string :relationship
      t.string :home_phone
      t.string :cell_phone
      t.string :work_phone
      t.string :personal_email
      t.string :work_email
      t.string :home_address
      t.string :work_address
      t.text :contact_notes 

      t.timestamps
    end
  end
end