class ChangeCompaniesTocompanies < ActiveRecord::Migration[5.2]
  def change
    rename_table :companies, :companies
  end
end
