class AddConfirmAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirm_admin, :string
  end
end
