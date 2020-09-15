class AddColumnStartDateToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :start_date, :datetime 
  end
end
