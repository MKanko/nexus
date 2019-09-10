class AddMultipleColumnsToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :last_meeting_date, :datetime
    add_column :contacts, :last_meeting_notes, :text
    add_column :contacts, :primary_contact, :boolean
  end
end
