class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.text :company_name
      t.belongs_to :user, foreign_key: true
      t.text :company_address
      t.text :company_type
      t.text :company_phone
      t.text :company_industry
      t.text :company_website
      t.text :company_email
      t.text :company_notes
      t.integer :primary_contact_id
  
      t.timestamps
    end
  end
end
