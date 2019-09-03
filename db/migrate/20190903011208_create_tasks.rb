class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.belongs_to :schedule, foreign_key: true
      t.belongs_to :client, foreign_key: true
      t.string :type
      t.string :status
      t.datetime :deadline
      t.text :notes

      t.timestamps
    end
  end
end
