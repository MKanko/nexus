class AddPrimaryContactIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :primary_contact_id, :integer
  end
end
