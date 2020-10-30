class Request < ApplicationRecord

  belongs_to :event_genre
  belongs_to :member

  enum approval_status: { responding: 0, approval: 1, denial: 2 }

end
