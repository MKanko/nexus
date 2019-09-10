class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :companies, :contact_position, :company_type
  end
end
