class RemoveLastMeetingNotesFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :last_meeting_notes, :text
  end
end
