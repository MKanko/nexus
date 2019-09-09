class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.belongs_to :user, foreign_key: true
      t.string :company_address
      t.string :company_contact
      t.string :contact_position
      t.string :contact_work_phone
      t.string :contact_cell_phone
      t.string :contact_email
      t.text :company_notes
      t.text :contact_notes
      t.datetime :last_meeting
      t.text :last_meeting_notes 

      t.timestamps
    end
  end
end