class AddScheduleItemToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :schedule_item, :text
  end
end
