class ChangecompanyToCompany < ActiveRecord::Migration[5.2]
  def change
    rename_table :companys, :companies
  end
end
