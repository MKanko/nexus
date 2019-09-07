class ChangeCompaniesToCompanys < ActiveRecord::Migration[5.2]
  def change
    rename_table :companies, :companys
  end
end
