class RemoveLastMeetingFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :last_meeting, :datetime
  end
end
