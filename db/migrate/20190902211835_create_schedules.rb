class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.text :name
      t.belongs_to :user, foreign_key: true
      t.text :type

      t.timestamps
    end
  end
end
