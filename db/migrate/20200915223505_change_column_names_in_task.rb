class ChangeColumnNamesInTask < ActiveRecord::Migration[5.2]
  def change
    change_table :tasks do |t|
      t.rename :date, :start_time
      t.rename :deadline, :end_time 
    end 
  end
end
