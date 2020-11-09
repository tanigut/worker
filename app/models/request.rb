class Request < ApplicationRecord

  belongs_to :event_genre
  belongs_to :member
  has_one :report

  enum approval_status: { responding: 0, approval: 1, denial: 2, finish: 3 }


  validates :chief_name, :body, :title, presence: true
  validates :people, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 20,
      allow_blank: true
    }

  validate :start_finish_check

  #日付のバリデーション
  #def start_finish_check
    #errors.add(:finish_day, "の日付を正しく記入してください。") unless
    #self.start_day < self.finish_day
  #end

  def start_finish_check
    if :start_day == "" || :finish_day == ""
      errors.add(:start_day, :finish_day, "を全て記入してください")
    elsif self.start_day > self.finish_day
      errors.add(:finish_day, "の日付を正しく記入してください。")
    end
  end


  #検索機能
  def self.search(search)
    if search == "all_match"
       @request = Request.all
    elsif search == "responding_match"
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
