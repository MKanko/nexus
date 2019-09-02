class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
      t.datetime :year
      t.datetime :month
      t.datetime :day_date
      t.string :day_name
      t.datetime :hour
      t.datetime :half_hour

      t.timestamps
    end
  end
end
