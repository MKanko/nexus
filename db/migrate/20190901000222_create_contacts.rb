class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text :name
      t.belongs_to :company, foreign_key: true 
      t.binary :photo
      t.text :contact_type
      t.text :relationship
      t.text :home_phone
      t.text :cell_phone
      t.text :work_phone
      t.text :personal_email
      t.text :work_email
      t.text :home_address
      t.text :work_address
      t.datetime :last_meeting_date
      t.text :last_meeting_notes
      t.boolean :primary_contact
      t.text :contact_notes 

      t.timestamps
    end
  end
end
