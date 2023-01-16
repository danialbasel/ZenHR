class JobApplication < ApplicationRecord
  belongs_to :User

  before_save { self.Seen = false }
end
