class Request < ApplicationRecord

  belongs_to :event_genre
  belongs_to :member
  has_one :report

  enum approval_status: { responding: 0, approval: 1, denial: 2, finish: 3 }

  def self.search(search)
    if search == "responding_match"
       @request = Request.where(approval_status: 0)
    elsif search == "approval_match"
       @request = Request.where(approval_status: 1)
    elsif search == "denial_match"
       @request = Request.where(approval_status: 2)
    elsif search == "finish_match"
       @request = Request.where(approval_status: 3)
    end
  end

end
