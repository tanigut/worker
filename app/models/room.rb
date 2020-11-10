class Room < ApplicationRecord

  has_many :messages
  belongs_to :member
  belongs_to :admin

end
