class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :name
      t.belongs_to :schedule, foreign_key: true
      t.belongs_to :company, foreign_key: true
      t.text :type
      t.text :status
      t.datetime :deadline
      t.datetime :date
      t.text :notes

      t.timestamps
    end
  end
end
