class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
