class Task < ApplicationRecord
  belongs_to :schedule
  belongs_to :client
end
