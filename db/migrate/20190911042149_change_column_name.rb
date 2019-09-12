class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :schedules, :type, :schedule_type
  end
end
