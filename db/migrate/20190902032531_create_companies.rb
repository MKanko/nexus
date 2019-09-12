class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.belongs_to :user, foreign_key: true
      t.string :company_address
      t.string :company_type
      t.string :company_phone
      t.string :company_industry
      t.string :company_website
      t.string :company_email
      t.text :company_notes
      t.integer :primary_contact_id
  
      t.timestamps
    end
  end
end
