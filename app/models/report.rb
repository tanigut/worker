class Report < ApplicationRecord

  belongs_to :member
  belongs_to :request
  attachment :image, destroy: false

end
