class Message < ApplicationRecord

  belongs_to :room
  enum status: { member_new: 0, admin_new: 1, saw: 2 }

  validates :content, presence: true

end
